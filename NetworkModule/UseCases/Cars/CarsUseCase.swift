//
//  CarsUseCase.swift
//  NetworkModule
//
//  Created by Grzegorz Makowski on 29/12/2019.
//  Copyright © 2019 Grzegorz Makowski. All rights reserved.
//

import Foundation
import DomainModule

//mocked CarUseCase
final class CarsUseCase: DomainModule.CarsUseCase {
    
    func cars(_ completion: @escaping (Result<[Car], Error>) -> ()) {
        let cars: [Car] = mockedCars
        let mockedResult: Result<[Car], Error> = .success(cars)
        completion(mockedResult)
    }
    
}
