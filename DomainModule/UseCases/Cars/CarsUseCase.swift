//
//  CarsUseCase.swift
//  DomainModule
//
//  Created by Grzegorz Makowski on 29/12/2019.
//  Copyright © 2019 Grzegorz Makowski. All rights reserved.
//

import Foundation

public protocol CarsUseCase {
    func cars(_ completion: @escaping (Result<[Car], Error>) -> ())
//    func save(_ car: Car, completion: @escaping () -> ())
//    func delete(_ car: Car, completion: @escaping () -> ())
}

//public protocol UseCase {
//    associatedtype T: Codable
//    func fetch(_ completion: @escaping (Result<T, Error>) -> ())
//}
