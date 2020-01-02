//
//  CellConfigurable.swift
//  Shop
//
//  Created by Grzegorz Makowski on 01/01/2020.
//  Copyright © 2020 Grzegorz Makowski. All rights reserved.
//

import UIKit

protocol CellConfigurable where Self: UITableViewCell {
    associatedtype T: BaseCellViewModel
    var viewModel: T? { get set }
    func bind(_ viewModel: T)
}
