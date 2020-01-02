//
//  SourceViewController.swift
//  Shop
//
//  Created by Grzegorz Makowski on 01/01/2020.
//  Copyright © 2020 Grzegorz Makowski. All rights reserved.
//

import UIKit

final class SourceViewController: UIViewController, ViewContentable {
    
    typealias ContentView = SourceView
    
    // MARK: Properties
    
    private let viewModel: SourceViewModel
    
    // MARK: Initialization
    
    init(viewModel: SourceViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    // MARK: View Lifecycle
    
    override func loadView() {
        loadContentView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
    }
    
    // MARK: Binding
    
    private func setupBindings() {
        contentView.offlineSourceButton
            .bind(observable: viewModel.offlineTap)
        
        contentView.onlineSourceButton
            .bind(observable: viewModel.onlineTap)
    }
}
