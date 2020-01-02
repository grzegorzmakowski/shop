//
//  BasketProductViewCellViewModel.swift
//  Shop
//
//  Created by Grzegorz Makowski on 01/01/2020.
//  Copyright © 2020 Grzegorz Makowski. All rights reserved.
//

import UIKit
import DomainModule

final class BasketProductViewCellViewModel: BaseCellViewModel {
    
    typealias QuantityChanged = (() -> Swift.Void)
    
    // MARK: Properties
    
    private var quantityChanged: QuantityChanged?
    private let basketProduct: DomainModule.BasketCarProduct
    
    var name: String {
        return basketProduct.product.name
    }
    
    var formattedPrice: String {
        return "\(basketProduct.product.price) $"
    }
    
    var image: UIImage? {
        return UIImage(named: name)
    }
    
    var totalPrice: Double {
        return basketProduct.totalPrice
    }
    
    // MARK: Initialization
    
    init(basketProduct: DomainModule.BasketCarProduct) {
        self.basketProduct = basketProduct
    }
    
    func setQuantity(_ quantity: Int) {
        basketProduct.quantity = quantity
        quantityChanged?()
    }
    
    // MARK: Binding
    
    func bindQuantityChanged(quantityChanged: QuantityChanged?) {
        self.quantityChanged = quantityChanged
    }
    
    func unbind() {
        self.quantityChanged = nil
    }
}
