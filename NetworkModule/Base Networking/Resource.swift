//
//  Resource.swift
//  NetworkModule
//
//  Created by Grzegorz Makowski on 29/12/2019.
//  Copyright © 2019 Grzegorz Makowski. All rights reserved.
//

import Foundation

struct Resource<A: Codable> {
    var urlRequest: URLRequest
}

extension Resource {
    init?(scheme: String, host: String, path: String, query: [String:String] = [:], method: HttpMethod) throws {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = path
        components.queryItems = query.map { URLQueryItem(name: $0.0, value: $0.1) }
        
        guard let url = components.url else { throw APIError.invalidUrl }
        urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.method
    }
}
