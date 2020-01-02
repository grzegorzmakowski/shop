//
//  BasketCoordinator.swift
//  Shop
//
//  Created by Grzegorz Makowski on 01/01/2020.
//  Copyright © 2020 Grzegorz Makowski. All rights reserved.
//

import UIKit
import DomainModule

final class BasketCoordinator: BaseCoordinator {
    
    // MARK: Properties
    
    private let useCaseProvider: DomainModule.UseCaseProvider
    
    // MARK: Initialization
    
    init(useCaseProvider: DomainModule.UseCaseProvider, controller: UIViewController?) {
        self.useCaseProvider = useCaseProvider
        super.init()
        self.controller = controller
    }
    
    // MARK: Coordinate
    
    override func start() {
        let basketViewModel: BasketViewModel = BasketViewModel()
        basketViewModel.closeBasketTap.bind { [weak self] _ in
            guard let self = self else { return }
            self.controller?.dismiss(animated: true, completion: nil)
            self.didFinish(coordinator: self)
        }
        
        let basketLogicController: BasketLogicController = BasketLogicController(carsUseCase: useCaseProvider.makeCarsUseCase(),
                                                                                 currencyRatesUseCase: useCaseProvider.makeCurrencyRatesUseCase(),
                                                                                 viewModel: basketViewModel)
        let basketViewController: BasketViewController = BasketViewController(controller: basketLogicController)
        
        let navigationController: UINavigationController = UINavigationController(rootViewController: basketViewController)
        controller?.present(navigationController, animated: true, completion: nil)
    }
}
