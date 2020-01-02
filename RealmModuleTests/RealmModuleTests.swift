//
//  RealmModuleTests.swift
//  RealmModuleTests
//
//  Created by Grzegorz Makowski on 29/12/2019.
//  Copyright © 2019 Grzegorz Makowski. All rights reserved.
//

import XCTest
@testable import RealmModule
@testable import DomainModule

class RealmModuleTests: XCTestCase {
    
    var currencyRatesUseCase: RealmModule.CurrencyRatesUseCase<MockedCurrencyRateRepository>!
    var carUseCase: RealmModule.CarsUseCase<MockedCarsRepository>!

    override func setUp() {
        super.setUp()
        currencyRatesUseCase = RealmModule.CurrencyRatesUseCase(repository: MockedCurrencyRateRepository())
        carUseCase = RealmModule.CarsUseCase(repository: MockedCarsRepository())
    }

    override func tearDown() {
        super.tearDown()
        carUseCase = nil
        currencyRatesUseCase = nil
    }

    func testValidCarsResponse() {
        
        var responseCarsError: Error?
        var responseCars: [Car]?
        
        carUseCase.cars { result in
            switch result {
            case .success(let cars):
                responseCars = cars
            case .failure(let error):
                responseCarsError = error
            }
        }
        
        XCTAssertNil(responseCarsError)
        XCTAssertNotNil(responseCars)
    }
    
    func testValidCurrencyRateResponse() {
        
        var responseCurrencyRateError: Error?
        var responseCurrencyRates: [CurrencyRate]?
        
        currencyRatesUseCase.rates { result in
            switch result {
            case .success(let currencyRates):
                responseCurrencyRates = currencyRates
            case .failure(let error):
                responseCurrencyRateError = error
            }
        }
        
        XCTAssertNil(responseCurrencyRateError)
        XCTAssertNotNil(responseCurrencyRates)
    }

}
