//
//  CurrencyRatesUseCase.swift
//  NetworkModule
//
//  Created by Grzegorz Makowski on 29/12/2019.
//  Copyright © 2019 Grzegorz Makowski. All rights reserved.
//

import Foundation
import DomainModule

final class CurrencyRatesUseCase: DomainModule.CurrencyRatesUseCase {
    
    // MARK: Properties
    
    private let network: CurrencyRateNetwork
    
    // MARK: Init
    
    init(network: CurrencyRateNetwork) {
        self.network = network
    }
    
    func rates(_ completion: @escaping (Result<[CurrencyRate], Error>) -> ()) {
        network.fetchCurrencyRates { result in
            switch result {
            case .success(let rates):
                completion(.success(rates.mockRates))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
