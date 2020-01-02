//
//  Observable.swift
//  Shop
//
//  Created by Grzegorz Makowski on 31/12/2019.
//  Copyright © 2019 Grzegorz Makowski. All rights reserved.
//

import Foundation

final class Observable<T> {
    
    typealias Listener = ((T) -> Void)
    
    // MARK: Properties
    
    var value: T {
        didSet {
            DispatchQueue.main.async {
                self.valueChanged?(self.value) /// there is no memory leak Roberto, weak self not needed :) https://youtu.be/oHg5SJYRHA0?t=44
            }
        }
    }
    
    private var valueChanged: Listener?
    
    // MARK: Initialization
    
    init(value: T) {
        self.value = value
    }
    
    // MARK: Bindings
    
    func bind(_ listener: Listener?) {
        valueChanged = listener
    }
    
    func unbind() {
        valueChanged = nil
    }
}
