//
//  Car.swift
//  DomainModule
//
//  Created by Grzegorz Makowski on 29/12/2019.
//  Copyright © 2019 Grzegorz Makowski. All rights reserved.
//

import Foundation

public struct Car: Product, Codable {
    public var id: String
    public var name: String
    public var price: Double
}

public var mockedCars: [Car] {
    return [
        Car(id: "1", name: "BMW", price: 105.99),
        Car(id: "2", name: "AUDI", price: 110.99),
        Car(id: "3", name: "MERCEDES", price: 85.99),
        Car(id: "4", name: "PORSCHE", price: 20.99)
    ]
}
