//
//  DomainModuleTests.swift
//  DomainModuleTests
//
//  Created by Grzegorz Makowski on 29/12/2019.
//  Copyright © 2019 Grzegorz Makowski. All rights reserved.
//

import XCTest
@testable import DomainModule

class DomainModuleTests: XCTestCase {

    func testRatesJSONMapping() throws {
        let bundle = Bundle(for: type(of: self))

        guard let url = bundle.url(forResource: "CurrencyRates", withExtension: "json") else {
            XCTFail("Missing file: CurrencyRates.json")
            return
        }

        let json = try Data(contentsOf: url)
        let rates: Rates = try JSONDecoder().decode(Rates.self, from: json)

        XCTAssertEqual(rates.code, 200)
    }

    func testCarJSONMapping() throws {
        let bundle = Bundle(for: type(of: self))

        guard let url = bundle.url(forResource: "Car", withExtension: "json") else {
            XCTFail("Missing file: Car.json")
            return
        }

        let json = try Data(contentsOf: url)
        let car: Car = try JSONDecoder().decode(Car.self, from: json)

        XCTAssertEqual(car.name, "BMW")
    }
    
    func testCurrencyRateEquality() {
        let currencyRate1: CurrencyRate = CurrencyRate(id: "USDEUR", rate: 0.8966197436, timestamp: Date().timeIntervalSince1970)
        let currencyRate2: CurrencyRate = CurrencyRate(id: "USDEUR", rate: 0.8966197436, timestamp: Date().timeIntervalSince1970)
        
        XCTAssertEqual(currencyRate1, currencyRate2)
    }
    
    func testCurrencyRateNotEqual() {
        let currencyRate1: CurrencyRate = CurrencyRate(id: "USDEUR", rate: 0.8966197436, timestamp: Date().timeIntervalSince1970)
        let currencyRate2: CurrencyRate = CurrencyRate(id: "EURUSD", rate: 0.8966197436, timestamp: Date().timeIntervalSince1970)
        
        XCTAssertNotEqual(currencyRate1, currencyRate2)
    }
    
    func testCurrencyRateName() {
        let currencyRate: CurrencyRate = CurrencyRate(id: "USDEUR", rate: 0.8966197436, timestamp: Date().timeIntervalSince1970)
        let expectedName: String = "EUR"
        XCTAssertEqual(expectedName, currencyRate.name)
    }
    
    func testPrefixRemove() {
        let currency: String = "USDEUR"
        let expectedCurrency: String = "EUR"
        
        let currencyWithoutPrefix = currency.deletingPrefix("USD")
        
        XCTAssertEqual(expectedCurrency, currencyWithoutPrefix)
    }
}
