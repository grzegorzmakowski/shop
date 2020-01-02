//
//  Repository.swift
//  RealmModule
//
//  Created by Grzegorz Makowski on 29/12/2019.
//  Copyright © 2019 Grzegorz Makowski. All rights reserved.
//

import Foundation

protocol Repository {
    associatedtype T
    func queryAll(_ completion: @escaping (Result<[T], Error>) -> ())
}
