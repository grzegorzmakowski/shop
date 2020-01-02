//
//  NetworkProvider.swift
//  NetworkModule
//
//  Created by Grzegorz Makowski on 29/12/2019.
//  Copyright © 2019 Grzegorz Makowski. All rights reserved.
//

import Foundation
import DomainModule

final class NetworkProvider {
    func makeCurrencyRatesNetwork() -> CurrencyRateNetwork {
        let network = BaseNetwork<DomainModule.Rates>()
        return CurrencyRateNetwork(network: network)
    }
}
