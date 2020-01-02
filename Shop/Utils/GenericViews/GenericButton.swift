//
//  GenericButton.swift
//  Shop
//
//  Created by Grzegorz Makowski on 01/01/2020.
//  Copyright © 2020 Grzegorz Makowski. All rights reserved.
//

import UIKit

final class GenericButton: UIButton {
    
    typealias GenericButtonClick = (() -> Swift.Void)
    
    // MARK: Properties
    
    var clickClosure: GenericButtonClick?
    
    // MARK: Initialization
    
    init() {
        super.init(frame: .zero)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    // MARK: Setup
    
    private func setupButton() {
        addTarget(self, action: #selector(clicked), for: .touchUpInside)
    }
    
    @objc private func clicked() {
        clickClosure?()
    }
    
    // MARK: Binding
    
    func bind(observable: Observable<AppEvent>) {
        clickClosure = { [weak observable] in
            observable?.value = .void
        }
    }
}
