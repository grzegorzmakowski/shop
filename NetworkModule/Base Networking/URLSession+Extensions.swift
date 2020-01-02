//
//  URLSession+Extensions.swift
//  NetworkModule
//
//  Created by Grzegorz Makowski on 28/12/2019.
//  Copyright © 2019 Grzegorz Makowski. All rights reserved.
//

import Foundation

extension URLSession {
    func load<A: Decodable>(_ resource: Resource<A>, completion: @escaping (Result<A, Error>) -> ()) {
        dataTask(with: resource.urlRequest) { data, urlResponse, error in
            guard let httpResponse = urlResponse as? HTTPURLResponse else { completion(.failure(APIError.requestFailed)); return }
            guard (200...299).contains(httpResponse.statusCode) else { completion(.failure(APIError.responseUnsuccessful)); return }
            guard let data = data else { completion(.failure(APIError.invalidData)); return }
            guard let decodedValue = try? JSONDecoder().decode(A.self, from: data) else {completion(.failure(APIError.jsonParsingFailure)); return }
            completion(.success(decodedValue))
        }.resume()
    }
}
