//
//  API.swift
//  NetworkModule
//
//  Created by Grzegorz Makowski on 29/12/2019.
//  Copyright © 2019 Grzegorz Makowski. All rights reserved.
//

import Foundation

protocol API {
    static var scheme: String { get }
    static var host: String { get }
}
