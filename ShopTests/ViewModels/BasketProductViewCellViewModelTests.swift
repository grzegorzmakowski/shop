//
//  BasketProductViewCellViewModelTests.swift
//  ShopTests
//
//  Created by Grzegorz Makowski on 01/01/2020.
//  Copyright © 2020 Grzegorz Makowski. All rights reserved.
//

import XCTest
@testable import Shop
@testable import DomainModule

class BasketProductViewCellViewModelTests: XCTestCase {
    
    var viewModel: BasketProductViewCellViewModel!

    override func setUp() {
        let car: Car = Car(id: "BMW", name: "BMW", price: 100.0)
        viewModel = BasketProductViewCellViewModel(basketProduct: BasketCarProduct(product: car))
    }

    override func tearDown() {
        viewModel = nil
    }

    func testFormattedPrice() {
        let formattedPrice: String = "100.0 $"
        
        XCTAssertEqual(formattedPrice, viewModel.formattedPrice)
    }
    
    func testName() {
        let name: String = "BMW"
        
        XCTAssertEqual(name, viewModel.name)
    }
    
    func testTotalPrice() {
        
        viewModel.setQuantity(10)
        
        XCTAssertEqual(1000.0, viewModel.totalPrice)
    }

}
