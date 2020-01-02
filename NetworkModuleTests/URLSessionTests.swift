//
//  URLSessionTests.swift
//  NetworkModuleTests
//
//  Created by Grzegorz Makowski on 28/12/2019.
//  Copyright © 2019 Grzegorz Makowski. All rights reserved.
//

import XCTest
@testable import NetworkModule

class URLSessionTests: XCTestCase {
    
    var urlSession: URLSession!

    override func setUp() {
        super.setUp()
        urlSession = URLSession.shared
        URLProtocol.registerClass(MockURLProtocol.self)
    }

    override func tearDown() {
        super.tearDown()
        urlSession = nil
        URLProtocol.unregisterClass(MockURLProtocol.self)
    }

    func testBaseURLSession() throws {
        
        //given
        let resource = try Resource<[String]>(scheme: "https", host: "www.example.com", path: "/example.json", method: .get)!
        let url = try XCTUnwrap(resource.urlRequest.url)
        
        MockURLProtocol.urls[url] = MockResponse(response: HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil)!, data: exampleJSON.data(using: .utf8)!)
        let promise = expectation(description: "Completion handler invoked")
        var response: [String]?
        var responseError: Error?
        
        // when
        
        urlSession.load(resource) { (result) in
            switch result {
            case .success(let cars):
                response = cars
            case .failure(let error):
                responseError = error
            }
            promise.fulfill()
        }
        wait(for: [promise], timeout: 3)

        // then
        XCTAssertNil(responseError)
        XCTAssertNotNil(response)
    }

}
