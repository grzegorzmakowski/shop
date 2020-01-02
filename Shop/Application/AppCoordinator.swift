//
//  AppCoordinator.swift
//  Shop
//
//  Created by Grzegorz Makowski on 01/01/2020.
//  Copyright © 2020 Grzegorz Makowski. All rights reserved.
//

import UIKit
import DomainModule

final class AppCoordinator: BaseCoordinator {
    
    // MARK: Properties
    
    enum Mode {
        case offline
        case online
    }
    
    weak var window: UIWindow?
    var application: Application
    
    // MARK: Initialization
    
    init(window: UIWindow, application: Application) {
        self.window = window
        self.application = application
        super.init()
    }
    
    // MARK: Coordinate
    
    override func start() {
        let viewModel: SourceViewModel = SourceViewModel()
        let viewController: SourceViewController = SourceViewController(viewModel: viewModel)
        
        viewModel.offlineTap.bind { [weak self] _ in
            self?.coordinateToBasket(.offline)
        }
        
        viewModel.onlineTap.bind { [weak self] _ in
            self?.coordinateToBasket(.online)
        }
        
        let navigation = UINavigationController(rootViewController: viewController)
        self.controller = navigation
        window?.rootViewController = navigation
        window?.makeKeyAndVisible()
    }
    
    private func coordinateToBasket(_ mode: Mode) {
        let useCaseProvider: DomainModule.UseCaseProvider = mode == .online ? application.networkProvider : application.realmProvider
        let basketCoordinator: BasketCoordinator = BasketCoordinator(useCaseProvider: useCaseProvider,
                                                                     controller: controller)
        
        start(coordinator: basketCoordinator)
    }
}
