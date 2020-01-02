//
//  CurrencyRateNetworkTest.swift
//  NetworkModuleTests
//
//  Created by Grzegorz Makowski on 29/12/2019.
//  Copyright © 2019 Grzegorz Makowski. All rights reserved.
//

import XCTest
@testable import DomainModule
@testable import NetworkModule

class CurrencyRateNetworkTest: XCTestCase {

    var urlSession: URLSession!
    var currencyRateNetwork: CurrencyRateNetwork!

    override func setUp() {
        super.setUp()
        urlSession = URLSession.shared
        currencyRateNetwork = CurrencyRateNetwork(network: BaseNetwork<Rates>(session: urlSession))
    }

    override func tearDown() {
        super.tearDown()
        urlSession = nil
        currencyRateNetwork = nil
    }
    
    func testRatesRequest() {
        
      // given
        let promise = expectation(description: "Completion handler invoked")
        var responseError: Error?
        var responseRates: Rates?

        // when
        currencyRateNetwork.fetchCurrencyRates { (result) in
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
        XCTAssertEqual(responseRates?.code, 200)
    }
}
