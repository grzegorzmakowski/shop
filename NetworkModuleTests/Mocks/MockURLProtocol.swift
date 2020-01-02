//
//  MockURLProtocol.swift
//  NetworkModuleTests
//
//  Created by Grzegorz Makowski on 28/12/2019.
//  Copyright © 2019 Grzegorz Makowski. All rights reserved.
//

import Foundation

let exampleJSON = """
[
    "BMW", "Audi", "Porsche"
]
"""

struct MockResponse {
    let response: HTTPURLResponse
    let data: Data
}

class MockURLProtocol: URLProtocol {
    static var urls = [URL: MockResponse]()

    override class func canInit(with request: URLRequest) -> Bool {
        guard let url = request.url else { return false }
        return urls.keys.contains(url)
    }

    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }

    override class func requestIsCacheEquivalent(_: URLRequest, to _: URLRequest) -> Bool {
        return false
    }

    override func startLoading() {
        guard let client = client, let url = request.url, let mock = MockURLProtocol.urls[url] else {
            fatalError()
        }

        client.urlProtocol(self, didReceive: mock.response, cacheStoragePolicy: .notAllowed)
        client.urlProtocol(self, didLoad: mock.data)
        client.urlProtocolDidFinishLoading(self)
    }

    override func stopLoading() {}
}
