//
//  CoordinatorTests.swift
//  ShopTests
//
//  Created by Grzegorz Makowski on 01/01/2020.
//  Copyright © 2020 Grzegorz Makowski. All rights reserved.
//

import XCTest
@testable import Shop

class CoordinatorTests: XCTestCase {
    
    var coordinator: MockCoordinator!

    override func setUp() {
        super.setUp()
        coordinator = MockCoordinator()
    }

    override func tearDown() {
        super.tearDown()
        coordinator = nil
    }

    func testAddChildCoordinator() {
        
        coordinator.start()
        
        XCTAssertEqual(1, coordinator.childCoordinators.count)
    }

    func testReleaseChildCoordinator() throws {
        
        coordinator.start()
        
        let childCoordinator = try XCTUnwrap(coordinator.childCoordinators.first)
        childCoordinator.didFinish(coordinator: childCoordinator)
        
        XCTAssertEqual(0, coordinator.childCoordinators.count)
    }
    
    func testRemoveChildCoordinator() throws {
        
        coordinator.start()
        
        coordinator.removeChildCoordinators()
        
        XCTAssertEqual(0, coordinator.childCoordinators.count)
    }
}

