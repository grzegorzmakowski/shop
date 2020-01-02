//
//  CurrencyPickerViewModelTests.swift
//  ShopTests
//
//  Created by Grzegorz Makowski on 01/01/2020.
//  Copyright © 2020 Grzegorz Makowski. All rights reserved.
//

import XCTest
@testable import Shop
@testable import DomainModule

class CurrencyPickerViewModelTests: XCTestCase {
    
    var viewModel: CurrencyPickerViewModel!
    
    override func setUp() {
        let currencyRate: CurrencyRate = CurrencyRate(id: "USDEUR", rate: 1.22, timestamp: Date().timeIntervalSinceNow)
        viewModel = CurrencyPickerViewModel(currencyRate: currencyRate)
    }

    override func tearDown() {
        viewModel = nil
    }

    func testTitle() {
        let title: String = "EUR - 1.22"
        
        XCTAssertEqual(title, viewModel.title)
    }
    
    func testRate() {
        let rate: Double = 1.22
        
        XCTAssertEqual(rate, viewModel.rate)
    }
    
}
