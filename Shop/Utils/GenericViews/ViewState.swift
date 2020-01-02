//
//  ViewState.swift
//  Shop
//
//  Created by Grzegorz Makowski on 01/01/2020.
//  Copyright © 2020 Grzegorz Makowski. All rights reserved.
//

import Foundation

enum ViewState {
    case loading
    case empty
    case error(Error)
    case success
}
