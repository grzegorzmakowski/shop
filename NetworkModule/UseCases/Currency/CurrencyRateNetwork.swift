//
//  CurrencyRateNetwork.swift
//  NetworkModule
//
//  Created by Grzegorz Makowski on 29/12/2019.
//  Copyright © 2019 Grzegorz Makowski. All rights reserved.
//

import DomainModule
import Foundation

public final class CurrencyRateNetwork {
    
    // MARK: Properties
    
    private let network: BaseNetwork<DomainModule.Rates>
    
    // MARK: Init

    init(network: BaseNetwork<DomainModule.Rates>) {
        self.network = network
    }

    public func fetchCurrencyRates(completion: @escaping (Result<DomainModule.Rates, Error>) -> ()) {
        do {
            let query: [String: String] = ["pairs":"USDUSD, USDEUR, USDJPY, USDPLN, USDAFN, USDALL, USDAMD, USDANG, USDDOP, USDETB"]
            let resource = try Resource<DomainModule.Rates>(scheme: CurrencyAPI.scheme,
                                                            host: CurrencyAPI.host,
                                                            path: "/api/live",
                                                            query: query,
                                                            method: .get)
            guard let unwrapResource = resource else { throw APIError.unknown }
            network.getItems(with: unwrapResource, completion: completion)
        } catch let error as APIError {
            completion(.failure(error))
        } catch {
            completion(.failure(APIError.unknown))
        }
    }
}
