//
//  UIView+Extensions.swift
//  Shop
//
//  Created by Grzegorz Makowski on 31/12/2019.
//  Copyright © 2019 Grzegorz Makowski. All rights reserved.
//

import UIKit

extension UIView {
    func activate(_ constraints: [NSLayoutConstraint]) {
        translatesAutoresizingMaskIntoConstraints = false
        constraints.forEach { $0.isActive = true }
    }
    
    func constraintAllEdges(to view: UIView, with insets: UIEdgeInsets) {
        activate(
            [
                topAnchor.constraint(equalTo: view.topAnchor, constant: insets.top),
                leftAnchor.constraint(equalTo: view.leftAnchor, constant: insets.left),
                rightAnchor.constraint(equalTo: view.rightAnchor, constant: -insets.right),
                bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -insets.bottom)
            ]
        )
    }
}
