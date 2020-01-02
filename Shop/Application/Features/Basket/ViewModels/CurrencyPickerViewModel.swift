//
//  CurrencyPickerViewModel.swift
//  Shop
//
//  Created by Grzegorz Makowski on 01/01/2020.
//  Copyright © 2020 Grzegorz Makowski. All rights reserved.
//

import Foundation
import DomainModule

final class CurrencyPickerViewModel: BasePickerViewModel {

    typealias Model = DomainModule.CurrencyRate
    
    // MARK: Properties
    
    var model: CurrencyRate
    
    var title: String {
        return "\(model.name) - \(model.rate.formattedPrice)"
    }
    
    var rate: Double {
        return model.rate
    }
    
    // MARK: Initialization
    
    init(currencyRate: DomainModule.CurrencyRate) {
        self.model = currencyRate
    }
}
