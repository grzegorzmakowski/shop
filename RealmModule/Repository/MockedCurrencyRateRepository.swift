//
//  MockedCurrencyRateRepository.swift
//  RealmModule
//
//  Created by Grzegorz Makowski on 29/12/2019.
//  Copyright © 2019 Grzegorz Makowski. All rights reserved.
//

import Foundation
import DomainModule

final class MockedCurrencyRateRepository: Repository {
    
    typealias T = DomainModule.CurrencyRate
    
    //it could be realm but it is a mock
    private var mockedCurrencyRateResult: Result<[DomainModule.CurrencyRate], Error> { return .success(mockedCurrencyRate) }
    
    func queryAll(_ completion: @escaping (Result<[T], Error>) -> ()) {
        completion(mockedCurrencyRateResult)
    }
}
