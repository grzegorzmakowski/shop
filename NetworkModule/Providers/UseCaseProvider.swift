//
//  UseCaseProvider.swift
//  NetworkModule
//
//  Created by Grzegorz Makowski on 29/12/2019.
//  Copyright © 2019 Grzegorz Makowski. All rights reserved.
//

import Foundation
import DomainModule

public final class UseCaseProvider: DomainModule.UseCaseProvider {
    
    // MARK: Properties
    
    private let networkProvider: NetworkProvider
    
    // MARK: Initializations

    public init() {
        networkProvider = NetworkProvider()
    }
    
    // MARK: UseCases
    
    public func makeCurrencyRatesUseCase() -> DomainModule.CurrencyRatesUseCase {
        return CurrencyRatesUseCase(network: networkProvider.makeCurrencyRatesNetwork())
    }
    
    public func makeCarsUseCase() -> DomainModule.CarsUseCase {
        return CarsUseCase()
    }
}
