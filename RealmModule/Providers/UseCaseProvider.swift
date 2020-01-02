//
//  UseCaseProvider.swift
//  RealmModule
//
//  Created by Grzegorz Makowski on 29/12/2019.
//  Copyright © 2019 Grzegorz Makowski. All rights reserved.
//

import Foundation
import DomainModule

public final class UseCaseProvider: DomainModule.UseCaseProvider {
    
    // MARK: Init
    
    public init() {}
    
    public func makeCurrencyRatesUseCase() -> DomainModule.CurrencyRatesUseCase {
        let repository: MockedCurrencyRateRepository = MockedCurrencyRateRepository()
        return CurrencyRatesUseCase(repository: repository)
    }
    
    public func makeCarsUseCase() -> DomainModule.CarsUseCase {
        let repository: MockedCarsRepository = MockedCarsRepository()
        return CarsUseCase(repository: repository)
    }
}
