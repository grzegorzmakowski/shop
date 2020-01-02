//
//  BasketViewModelTests.swift
//  ShopTests
//
//  Created by Grzegorz Makowski on 01/01/2020.
//  Copyright © 2020 Grzegorz Makowski. All rights reserved.
//

import XCTest
@testable import Shop
@testable import DomainModule

class BasketViewModelTests: XCTestCase {

    var viewModel: BasketViewModel!

    override func setUp() {
        viewModel = BasketViewModel()
    }

    override func tearDown() {
        viewModel = nil
    }

    func testViewModelCalculate() {
        // given
        
        let currencies: [CurrencyRate] = [
            CurrencyRate(id: "USDUSD", rate: 1.0, timestamp: Date().timeIntervalSince1970),
            CurrencyRate(id: "USDEUR", rate: 0.8966197436, timestamp: Date().timeIntervalSince1970),
            CurrencyRate(id: "USDPLN", rate: 3.8259661078, timestamp: Date().timeIntervalSince1970),
            CurrencyRate(id: "USDCHF", rate: 0.9764189007, timestamp: Date().timeIntervalSince1970)
        ]
        
        let cars: [Car] = [
            Car(id: "1", name: "BMW", price: 105.99),
            Car(id: "2", name: "AUDI", price: 110.99),
            Car(id: "3", name: "MERCEDES", price: 85.99),
            Car(id: "4", name: "PORSCHE", price: 20.99)
        ]
        
        // when
        
        viewModel.applyCurrencies(currencies: currencies)
        viewModel.applyProducts(products: cars)
        viewModel.basketProductViewModels.value.first?.setQuantity(2)
        
        // then
        
        XCTAssertEqual(211.98, viewModel.amount.value)
    }
    
    func testViewModelDefaultSelectedCurrency() {
        // given
        
        let currencies: [CurrencyRate] = [
            CurrencyRate(id: "USDUSD", rate: 1.0, timestamp: Date().timeIntervalSince1970),
            CurrencyRate(id: "USDEUR", rate: 0.8966197436, timestamp: Date().timeIntervalSince1970),
            CurrencyRate(id: "USDPLN", rate: 3.8259661078, timestamp: Date().timeIntervalSince1970),
            CurrencyRate(id: "USDCHF", rate: 0.9764189007, timestamp: Date().timeIntervalSince1970)
        ]
        
        // when
        viewModel.applyCurrencies(currencies: currencies)
        
        // then
        
        XCTAssertEqual(viewModel.selectedCurrency?.model, currencies.first)
    }

}
