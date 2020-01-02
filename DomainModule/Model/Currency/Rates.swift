//
//  Rates.swift
//  DomainModule
//
//  Created by Grzegorz Makowski on 29/12/2019.
//  Copyright © 2019 Grzegorz Makowski. All rights reserved.
//

import Foundation

public struct Rates: Codable {
    
    public let rates: [CurrencyRate]?
    public let code: Int
    public var mockRates: [CurrencyRate] { return rates ?? mockedCurrencyRate } // API sometimes is not working, this is mock
    
    enum CodingKeys: String, CodingKey {
        case rates = "rates"
        case code = "code"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let code = try values.decode(Int.self, forKey: CodingKeys.code)
        let dict = try values.decodeIfPresent([String: BasicCurrencyRate].self, forKey: CodingKeys.rates)
        
        self.rates = dict?.compactMap { CurrencyRate(id: $0, rate: $1.rate, timestamp: $1.timestamp) }
        self.code = code
    }
}
