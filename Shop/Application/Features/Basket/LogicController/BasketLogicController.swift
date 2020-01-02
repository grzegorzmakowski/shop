//
//  BasketLogicController.swift
//  Shop
//
//  Created by Grzegorz Makowski on 31/12/2019.
//  Copyright © 2019 Grzegorz Makowski. All rights reserved.
//

import Foundation
import NetworkModule
import DomainModule

final class BasketLogicController {
    
    // MARK: Properties
    
    let viewModel: BasketViewModel
    let carsUseCase: DomainModule.CarsUseCase
    let currencyRatesUseCase: DomainModule.CurrencyRatesUseCase
    private let dispatchGroup: DispatchGroup = DispatchGroup()
    
    // MARK: Initialization
    
    init(carsUseCase: DomainModule.CarsUseCase = NetworkModule.UseCaseProvider().makeCarsUseCase(),
         currencyRatesUseCase: DomainModule.CurrencyRatesUseCase = NetworkModule.UseCaseProvider().makeCurrencyRatesUseCase(),
         viewModel: BasketViewModel = BasketViewModel()) {
        self.carsUseCase = carsUseCase
        self.currencyRatesUseCase = currencyRatesUseCase
        self.viewModel = viewModel
    }
    
    // MARK: Logic
    
    func start() {
        
        var carsResult: Result<[DomainModule.Car], Error>?
        var ratesResult: Result<[DomainModule.CurrencyRate], Error>?
        
        viewModel.viewState.value = .loading
        
        dispatchGroup.enter()
        carsUseCase.cars { [weak self] result in
            guard let self = self else { return }
            self.dispatchGroup.leave()
            carsResult = result
            switch result {
            case .success(let cars):
                self.viewModel.applyProducts(products: cars)
            case .failure(let error):
                self.viewModel.viewState.value = .error(error)
            }
        }
        
        dispatchGroup.enter()
        currencyRatesUseCase.rates { [weak self] result in
            guard let self = self else { return }
            self.dispatchGroup.leave()
            ratesResult = result
            switch result {
            case .success(let currencyRates):
                self.viewModel.applyCurrencies(currencies: currencyRates)
            case .failure(let error):
                self.viewModel.viewState.value = .error(error)
            }
        }
        
        dispatchGroup.notify(queue: .main) { [weak self] in
            guard let self = self else { return }
            guard case .success(_) = carsResult else { return }
            guard case .success(_) = ratesResult else { return }
            self.viewModel.viewState.value = .success
        }
    }
    
}
