//
//  CarsUseCase.swift
//  RealmModule
//
//  Created by Grzegorz Makowski on 29/12/2019.
//  Copyright © 2019 Grzegorz Makowski. All rights reserved.
//

import Foundation
import DomainModule

final class CarsUseCase<T: Repository>: DomainModule.CarsUseCase where T.T == DomainModule.Car {
    
    // MARK: Properties
    
    private let repository: T
    
    // MARK: Init
    
    init(repository: T) {
        self.repository = repository
    }
    
    func cars(_ completion: @escaping (Result<[Car], Error>) -> ()) {
        repository.queryAll(completion)
    }
    
}
