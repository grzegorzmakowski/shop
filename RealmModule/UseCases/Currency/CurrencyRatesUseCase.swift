//
//  CurrencyRatesUseCase.swift
//  RealmModule
//
//  Created by Grzegorz Makowski on 29/12/2019.
//  Copyright © 2019 Grzegorz Makowski. All rights reserved.
//

import Foundation
import DomainModule

final class CurrencyRatesUseCase<T: Repository>: DomainModule.CurrencyRatesUseCase where T.T == DomainModule.CurrencyRate {
    
    // MARK: Properties
    
    private let repository: T
    
    // MARK: Init
    
    init(repository: T) {
        self.repository = repository
    }
    
    func rates(_ completion: @escaping (Result<[CurrencyRate], Error>) -> ()) {
        repository.queryAll(completion)
    }
    
}
