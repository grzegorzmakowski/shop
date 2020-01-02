//
//  BaseCoordinator.swift
//  Shop
//
//  Created by Grzegorz Makowski on 01/01/2020.
//  Copyright © 2020 Grzegorz Makowski. All rights reserved.
//

import UIKit

protocol Coordinator: AnyObject {
    var controller: UIViewController? { get set }
    var parentCoordinator: Coordinator? { get set }
    var childCoordinators: [Coordinator] { get set }
    
    func start()
    func start(coordinator: Coordinator)
    func didFinish(coordinator: Coordinator)
    func removeChildCoordinators()
}

extension Coordinator {
    func start(coordinator: Coordinator) {
        childCoordinators.append(coordinator)
        coordinator.parentCoordinator = self
        coordinator.start()
    }
    
    func removeChildCoordinators() {
        self.childCoordinators.forEach { $0.removeChildCoordinators() }
        self.childCoordinators.removeAll()
    }
    
    func didFinish(coordinator: Coordinator) {
        guard let parentCoordinator = parentCoordinator else { return }
        parentCoordinator.childCoordinators = parentCoordinator.childCoordinators.filter { $0 !== coordinator }
    }
}

class BaseCoordinator: Coordinator {
    
    // MARK: Properties
    
    var controller: UIViewController?
    weak var parentCoordinator: Coordinator?
    var childCoordinators: [Coordinator] = [Coordinator]()
    
    // MARK: Coordinate
    
    func start() {
        assertionFailure("start method not implemented")
    }
}

///or second approach 🤔

protocol PromoCoordinatorPresenter {
    associatedtype Controller: UIViewController
    var presenter: Controller? { get set }
}

protocol PromoBaseCoordinator: class {
    var parentCoordinator: PromoBaseCoordinator? { get set }
    var childCoordinators: [PromoBaseCoordinator] { get set }
    
    func start()
    func start(coordinator: PromoBaseCoordinator)
    func didFinish(coordinator: PromoBaseCoordinator)
    func removeChildCoordinators()
}


extension PromoBaseCoordinator {
    func start(coordinator: PromoBaseCoordinator) {
        childCoordinators.append(coordinator)
        coordinator.parentCoordinator = self
        coordinator.start()
    }
    
    func removeChildCoordinators() {
        self.childCoordinators.forEach { $0.removeChildCoordinators() }
        self.childCoordinators.removeAll()
    }
    
    func didFinish(coordinator: PromoBaseCoordinator) {
        guard let parentCoordinator = parentCoordinator else { return }
        parentCoordinator.childCoordinators = parentCoordinator.childCoordinators.filter { $0 !== coordinator }
    }
}
 
typealias PromoCoordinator = PromoBaseCoordinator & PromoCoordinatorPresenter

class ApplicationCoordinator: PromoCoordinator {
    
    typealias Controller = UINavigationController
    
    var presenter: UINavigationController?
    var parentCoordinator: PromoBaseCoordinator?
    var childCoordinators: [PromoBaseCoordinator] = []
    
    func start() {
        
    }
    
}
