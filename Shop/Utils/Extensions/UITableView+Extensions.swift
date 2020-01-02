//
//  UITableView+Extensions.swift
//  Shop
//
//  Created by Grzegorz Makowski on 30/12/2019.
//  Copyright © 2019 Grzegorz Makowski. All rights reserved.
//

import UIKit

extension UITableView {
    func register<T: UITableViewCell>(_ cellClass: T.Type) {
        register(cellClass, forCellReuseIdentifier: T.reuseIdentifier)
    }
}

extension UITableViewCell {
    static var reuseIdentifier: String { return String(describing: self) }
}
