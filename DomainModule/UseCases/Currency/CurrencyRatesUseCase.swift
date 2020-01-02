//
//  CurrencyRatesUseCase.swift
//  DomainModule
//
//  Created by Grzegorz Makowski on 29/12/2019.
//  Copyright © 2019 Grzegorz Makowski. All rights reserved.
//

import Foundation

public protocol CurrencyRatesUseCase {
    func rates(_ completion: @escaping (Result<[CurrencyRate], Error>) -> ())
//    func save(_ rate: CurrencyRate, completion: @escaping () -> ())
//    func delete(_ rate: CurrencyRate, completion: @escaping () -> ())
}
