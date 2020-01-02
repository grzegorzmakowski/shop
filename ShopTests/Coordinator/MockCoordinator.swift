//
//  MockCoordinator.swift
//  ShopTests
//
//  Created by Grzegorz Makowski on 01/01/2020.
//  Copyright © 2020 Grzegorz Makowski. All rights reserved.
//

import Foundation
@testable import Shop

class MockCoordinator: BaseCoordinator {
    
    override func start() {
        let childCoordinator: MockChildCoordinator = MockChildCoordinator()
        start(coordinator: childCoordinator)
    }
}

class MockChildCoordinator: BaseCoordinator {
    override func start() {}
}
