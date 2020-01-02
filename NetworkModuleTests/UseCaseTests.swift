//
//  UseCaseTests.swift
//  NetworkModuleTests
//
//  Created by Grzegorz Makowski on 30/12/2019.
//  Copyright © 2019 Grzegorz Makowski. All rights reserved.
//

import XCTest
@testable import DomainModule
@testable import NetworkModule

class UseCaseTests: XCTestCase {

    var currencyRatesUseCase: NetworkModule.CurrencyRatesUseCase!
    var carsUseCase: NetworkModule.CarsUseCase!

    override func setUp() {
        super.setUp()
        let urlSession = URLSession.shared
        let currencyRateNetwork = CurrencyRateNetwork(network: BaseNetwork<Rates>(session: urlSession))
        currencyRatesUseCase = NetworkModule.CurrencyRatesUseCase(network: currencyRateNetwork)
        carsUseCase = NetworkModule.CarsUseCase()
    }

    override func tearDown() {
        super.tearDown()
        currencyRatesUseCase = nil
        carsUseCase = nil
    }
    
    func testCurrencyRatesUseCase() {
        
      // given
        let promise = expectation(description: "Completion handler invoked")
        var responseError: Error?
        var responseRates: [CurrencyRate]?

        // when
        currencyRatesUseCase.rates { (result) in
            switch result {
            case .success(let rates):
                responseRates = rates
            case .failure(let error):
                responseError = error
            }
            promise.fulfill()
        }
        wait(for: [promise], timeout: 3)

        // then
        XCTAssertNil(responseError)
        XCTAssertNotNil(responseRates)
    }
    
    func testCarsUseCase() {
        
      // given
        let promise = expectation(description: "Completion handler invoked")
        var responseError: Error?
        var responseCars: [Car]?

        // when
        carsUseCase.cars { (result) in
            switch result {
            case .success(let cars):
                responseCars = cars
            case .failure(let error):
                responseError = error
            }
            promise.fulfill()
        }
        wait(for: [promise], timeout: 3)

        // then
        XCTAssertNil(responseError)
        XCTAssertNotNil(responseCars)
    }
}
