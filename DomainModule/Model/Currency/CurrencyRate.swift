//
//  CurrencyRate.swift
//  DomainModule
//
//  Created by Grzegorz Makowski on 29/12/2019.
//  Copyright © 2019 Grzegorz Makowski. All rights reserved.
//

import Foundation

struct BasicCurrencyRate: Decodable {
    public let rate: Double
    public let timestamp: Double
}

public struct CurrencyRate: Codable, Equatable {
    public let id: String
    public let rate: Double
    public let timestamp: Double
    
    public var name: String {
        return id.deletingPrefix("USD")
    }
    
    public static func == (lhs: CurrencyRate, rhs: CurrencyRate) -> Bool {
        return lhs.id == rhs.id
    }
}

public var mockedCurrencyRate: [CurrencyRate] {
    return [
        CurrencyRate(id: "USDUSD", rate: 0.9764189007, timestamp: Date().timeIntervalSince1970),
        CurrencyRate(id: "USDEUR", rate: 0.8966197436, timestamp: Date().timeIntervalSince1970),
        CurrencyRate(id: "USDPLN", rate: 3.8259661078, timestamp: Date().timeIntervalSince1970),
        CurrencyRate(id: "USDCHF", rate: 0.9764189007, timestamp: Date().timeIntervalSince1970)
    ]
}
