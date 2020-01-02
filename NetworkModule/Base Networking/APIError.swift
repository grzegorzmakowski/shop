//
//  APIError.swift
//  NetworkModule
//
//  Created by Grzegorz Makowski on 29/12/2019.
//  Copyright © 2019 Grzegorz Makowski. All rights reserved.
//

import Foundation

public enum APIError: Error {
    case invalidUrl
    case requestFailed
    case invalidData
    case responseUnsuccessful
    case jsonParsingFailure
    case unknown
}
