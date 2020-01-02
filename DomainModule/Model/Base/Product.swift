//
//  Product.swift
//  DomainModule
//
//  Created by Grzegorz Makowski on 01/01/2020.
//  Copyright © 2020 Grzegorz Makowski. All rights reserved.
//

import Foundation

public protocol Product {
    var id: String { get set }
    var name: String { get set }
    var price: Double { get set }
}

public protocol BaseBasketItem {
    associatedtype T: Product
    var product: T { get set }
    var quantity: Int { get set }
    var totalPrice: Double { get }
}

public extension BaseBasketItem {
    var totalPrice: Double {
        return product.price * Double(quantity)
    }
}

public class BasketCarProduct: BaseBasketItem {
    
    public typealias T = Car
    
    public var product: Car
    public var quantity: Int
    
    public init(product: Car, quantity: Int = 0) {
        self.product = product
        self.quantity = quantity
    }
}
