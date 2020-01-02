//
//  Application.swift
//  Shop
//
//  Created by Grzegorz Makowski on 29/12/2019.
//  Copyright © 2019 Grzegorz Makowski. All rights reserved.
//

import Foundation
import DomainModule
import NetworkModule
import RealmModule

enum AppEvent {
    case void
}

final class Application {
    
    let networkProvider: DomainModule.UseCaseProvider
    let realmProvider: DomainModule.UseCaseProvider
    
    init() {
        networkProvider = NetworkModule.UseCaseProvider()
        realmProvider = RealmModule.UseCaseProvider()
    }
}
