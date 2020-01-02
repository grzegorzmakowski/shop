//
//  BasketViewModel.swift
//  Shop
//
//  Created by Grzegorz Makowski on 31/12/2019.
//  Copyright © 2019 Grzegorz Makowski. All rights reserved.
//

import Foundation
import DomainModule

final class BasketViewModel {
    
    // MARK: Properties
    
    let viewState = Observable<ViewState?>(value: nil)
    let closeBasketTap = Observable<AppEvent>(value: .void)
    let amount: Observable<Double> = Observable<Double>(value: 0.0)
    let basketProductViewModels = Observable<[BasketProductViewCellViewModel]>(value: [])
    let currencyRateViewModels = Observable<[CurrencyPickerViewModel]>(value: [])
    var selectedCurrency: CurrencyPickerViewModel? = nil { didSet { calculate() } }
    
    // MARK: Setup basket
    
    func applyProducts(products: [DomainModule.Car]) {
        
        let viewModels: [BasketProductViewCellViewModel] = products
            .map { car -> BasketProductViewCellViewModel in
                let basketProduct = DomainModule.BasketCarProduct(product: car)
                let viewModel = BasketProductViewCellViewModel(basketProduct: basketProduct)
                viewModel.bindQuantityChanged { [weak self] in
                    self?.calculate()
                }
                return viewModel
            }
        
        basketProductViewModels.value = viewModels
    }
    
    func applyCurrencies(currencies: [DomainModule.CurrencyRate]) {
        currencyRateViewModels.value = currencies.map { CurrencyPickerViewModel(currencyRate: $0) }
        selectedCurrency = currencyRateViewModels.value.first
    }
    
    // MARK: Calculate
    
    func calculate() {
        var totalAmount: Double = 0.0
        basketProductViewModels.value.forEach { vieModel in
            totalAmount = totalAmount + vieModel.totalPrice
        }
        guard let selectedCurrency = self.selectedCurrency else { return }
        amount.value = (totalAmount * selectedCurrency.rate).roundToDecimal(2)
    }
}
