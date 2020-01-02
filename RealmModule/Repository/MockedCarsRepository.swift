//
//  MockedCarsRepository.swift
//  RealmModule
//
//  Created by Grzegorz Makowski on 29/12/2019.
//  Copyright © 2019 Grzegorz Makowski. All rights reserved.
//

import Foundation
import DomainModule

final class MockedCarsRepository: Repository {
    
    typealias T = DomainModule.Car
    
    //it could be realm but it is a mock
    private var mockedCarsResult: Result<[DomainModule.Car], Error> { return .success(mockedCars) }
    
    func queryAll(_ completion: @escaping (Result<[T], Error>) -> ()) {
        completion(mockedCarsResult)
    }
}
