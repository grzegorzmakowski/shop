//
//  UseCaseProvider.swift
//  DomainModule
//
//  Created by Grzegorz Makowski on 29/12/2019.
//  Copyright © 2019 Grzegorz Makowski. All rights reserved.
//

import Foundation

public protocol UseCaseProvider {
    func makeCarsUseCase() -> CarsUseCase
    func makeCurrencyRatesUseCase() -> CurrencyRatesUseCase
}
