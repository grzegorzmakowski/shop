//
//  BasketViewController.swift
//  Shop
//
//  Created by Grzegorz Makowski on 28/12/2019.
//  Copyright © 2019 Grzegorz Makowski. All rights reserved.
//

import UIKit

final class BasketViewController: UIViewController, ViewContentable {
    
    typealias ContentView = BasketView
    
    // MARK: Properties
    
    private let controller: BasketLogicController
    private let dataSource: DataSource<BasketProductViewCellViewModel, BasketProductViewCell>
    private let currencyDatasource: BasePickerDatasource<CurrencyPickerViewModel>
    
    // MARK: Initialization
    
    init(controller: BasketLogicController = BasketLogicController(),
         dataSource: DataSource<BasketProductViewCellViewModel, BasketProductViewCell> = DataSource<BasketProductViewCellViewModel, BasketProductViewCell>(),
         currencyDatasource: BasePickerDatasource<CurrencyPickerViewModel> = BasePickerDatasource<CurrencyPickerViewModel>())  {
        self.controller = controller
        self.dataSource = dataSource
        self.currencyDatasource = currencyDatasource
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    // MARK: View lifecycle
    
    override func loadView() {
        loadContentView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isModalInPresentation = true
        setupBindings()
        setupDatasources()
        controller.start()
    }
    
    // MARK: Setup
    
    private func setupDatasources() {
        contentView.tableView.dataSource = dataSource
        contentView.currencyPickerView.dataSource = currencyDatasource
        contentView.currencyPickerView.delegate = currencyDatasource
    }
    
    // MARK: Bindings
    
    private func setupBindings() {
        
        dataSource.items.bind { [weak self] _ in
            self?.contentView.tableView.reloadData()
        }
        
        currencyDatasource.items.bind { [weak self] _ in
            self?.contentView.currencyPickerView.reloadAllComponents()
        }
        
        currencyDatasource.selected.bind { [weak self] selectedCurrency in
            self?.controller.viewModel.selectedCurrency = selectedCurrency
        }
        
        controller.viewModel.currencyRateViewModels.bind { [weak self] currencyRates in
            self?.currencyDatasource.items.value = currencyRates
        }
        
        controller.viewModel.basketProductViewModels.bind { [weak self] basketItems in
            self?.dataSource.items.value = basketItems
        }
        
        controller.viewModel.amount.bind { [weak self] amount in
            self?.contentView.amountLabel.text = "\(amount)"
        }
        
        controller.viewModel.viewState.bind { [weak self] viewState in
            self?.contentView.setView(with: viewState)
        }
        
        contentView.closeBasketButton
            .bind(observable: controller.viewModel.closeBasketTap)
    }
}
