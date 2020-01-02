//
//  BaseNetwork.swift
//  NetworkModule
//
//  Created by Grzegorz Makowski on 29/12/2019.
//  Copyright © 2019 Grzegorz Makowski. All rights reserved.
//

import Foundation

final class BaseNetwork<T: Codable> {
    
    // MARK: Properties
    
    private let session: URLSession
    
    // MARK: Init
    
    init(session: URLSession = URLSession.init(configuration: .default)) {
        self.session = session
    }
    
    // MARK: REST BASIC METHODS
    
    func getItems(with resource: Resource<T>, completion: @escaping (Result<T, Error>) -> ()) {
        session.load(resource, completion: completion)
    }
}
