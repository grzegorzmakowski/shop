//
//  BasePickerDatasourceTests.swift
//  ShopTests
//
//  Created by Grzegorz Makowski on 01/01/2020.
//  Copyright © 2020 Grzegorz Makowski. All rights reserved.
//

import XCTest
@testable import Shop
@testable import DomainModule

class BasePickerDatasourceTests: XCTestCase {
    
    var dataSource: BasePickerDatasource<CurrencyPickerViewModel>!
    var pickerView: UIPickerView!
    

    override func setUp() {
        pickerView = UIPickerView()
        dataSource = BasePickerDatasource<CurrencyPickerViewModel>()
    }

    override func tearDown() {
        dataSource = nil
    }

    func testNumberOfRows() {
        // given
        
        let viewModels: [CurrencyPickerViewModel] = [
            CurrencyPickerViewModel(currencyRate: CurrencyRate(id: "USDUSD", rate: 1.0, timestamp: Date().timeIntervalSince1970)),
            CurrencyPickerViewModel(currencyRate: CurrencyRate(id: "USDEUR", rate: 1.0, timestamp: Date().timeIntervalSince1970)),
            CurrencyPickerViewModel(currencyRate: CurrencyRate(id: "USDPLN", rate: 1.0, timestamp: Date().timeIntervalSince1970))
        ]
        
        // when
        dataSource.items.value = viewModels
        
        // then
        
        XCTAssertEqual(3, dataSource.pickerView(pickerView, numberOfRowsInComponent: 0))
    }
    
    func testSelectedValue() {
        // given
        
        let viewModels: [CurrencyPickerViewModel] = [
            CurrencyPickerViewModel(currencyRate: CurrencyRate(id: "USDUSD", rate: 1.0, timestamp: Date().timeIntervalSince1970)),
            CurrencyPickerViewModel(currencyRate: CurrencyRate(id: "USDEUR", rate: 1.0, timestamp: Date().timeIntervalSince1970)),
            CurrencyPickerViewModel(currencyRate: CurrencyRate(id: "USDPLN", rate: 1.0, timestamp: Date().timeIntervalSince1970))
        ]
        
        // when
        dataSource.items.value = viewModels
        dataSource.pickerView(pickerView, didSelectRow: 1, inComponent: 0)
        
        // then
        
        XCTAssertEqual("USDEUR", dataSource.selected.value?.model.id)
    }
    
    func testPickerTitle() {
        // given
        
        let viewModels: [CurrencyPickerViewModel] = [
            CurrencyPickerViewModel(currencyRate: CurrencyRate(id: "USDUSD", rate: 1.0, timestamp: Date().timeIntervalSince1970)),
            CurrencyPickerViewModel(currencyRate: CurrencyRate(id: "USDEUR", rate: 1.0, timestamp: Date().timeIntervalSince1970)),
            CurrencyPickerViewModel(currencyRate: CurrencyRate(id: "USDPLN", rate: 1.0, timestamp: Date().timeIntervalSince1970))
        ]
        
        // when
        dataSource.items.value = viewModels
        
        // then
        XCTAssertEqual("USD - 1.0", dataSource.pickerView(pickerView, titleForRow: 0, forComponent: 0))
    }
    
}
