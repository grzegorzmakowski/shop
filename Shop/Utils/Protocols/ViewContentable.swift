//
//  ViewContentable.swift
//  Shop
//
//  Created by Grzegorz Makowski on 30/12/2019.
//  Copyright © 2019 Grzegorz Makowski. All rights reserved.
//

import UIKit

protocol ViewContentable where Self: UIViewController {
    associatedtype ContentView: UIView
    var contentView: ContentView { get }
    func loadContentView()
}

extension ViewContentable {
    var contentView: ContentView {
        guard let contentView = view as? ContentView else { fatalError("Invalid implementation of contentView") }
        return contentView
    }
    
    func loadContentView() {
        view = ContentView()
    }
}
