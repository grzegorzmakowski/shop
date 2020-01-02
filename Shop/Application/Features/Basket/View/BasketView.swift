//
//  BasketView.swift
//  Shop
//
//  Created by Grzegorz Makowski on 30/12/2019.
//  Copyright © 2019 Grzegorz Makowski. All rights reserved.
//

import UIKit

final class BasketView: UIView {
    
    // MARK: Properties

    let tableView: UITableView = Subviews.tableView
    let basketView: UIView = Subviews.basketView
    let currencyPickerView: UIPickerView = Subviews.currencyPickerView
    let amountLabel: UILabel = Subviews.amountLabel
    let messageLabel: UILabel = Subviews.messageLabel
    let closeBasketButton: GenericButton = Subviews.closeBasketButton
    
    // MARK: Initialization
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .cyan
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    // MARK: Setup
    
    private func setupLayout() {
        addSubview(tableView)
        tableView.activate(
            [
                tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Layout.margin.big),
                tableView.leftAnchor.constraint(equalTo: leftAnchor, constant: Layout.margin.normal),
                tableView.rightAnchor.constraint(equalTo: rightAnchor, constant: -Layout.margin.normal)
            ]
        )
        
        addSubview(basketView)
        basketView.activate(
            [
                basketView.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: Layout.margin.big),
                basketView.leftAnchor.constraint(equalTo: leftAnchor, constant: Layout.margin.normal),
                basketView.rightAnchor.constraint(equalTo: rightAnchor, constant: -Layout.margin.normal)
            ]
        )
        
        basketView.addSubview(amountLabel)
        amountLabel.activate(
            [
                amountLabel.topAnchor.constraint(equalTo: basketView.topAnchor, constant: Layout.margin.small),
                amountLabel.leftAnchor.constraint(equalTo: basketView.leftAnchor, constant: Layout.margin.normal),
                amountLabel.rightAnchor.constraint(equalTo: basketView.rightAnchor, constant: -Layout.margin.normal)
            ]
        )
        
        basketView.addSubview(currencyPickerView)
        currencyPickerView.activate(
            [
                currencyPickerView.topAnchor.constraint(equalTo: amountLabel.bottomAnchor, constant: Layout.margin.small),
                currencyPickerView.leftAnchor.constraint(equalTo: basketView.leftAnchor, constant: Layout.margin.normal),
                currencyPickerView.rightAnchor.constraint(equalTo: basketView.rightAnchor, constant: -Layout.margin.normal),
                currencyPickerView.bottomAnchor.constraint(equalTo: basketView.bottomAnchor)
            ]
        )
        
        addSubview(closeBasketButton)
        closeBasketButton.activate(
            [
                closeBasketButton.topAnchor.constraint(equalTo: basketView.bottomAnchor, constant: Layout.margin.small),
                closeBasketButton.leftAnchor.constraint(equalTo: leftAnchor, constant: Layout.margin.normal),
                closeBasketButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -Layout.margin.normal),
                closeBasketButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -Layout.margin.normal)
            ]
        )
        
        addSubview(messageLabel)
        messageLabel.activate(
            [
                messageLabel.leftAnchor.constraint(equalTo: leftAnchor),
                messageLabel.rightAnchor.constraint(equalTo: rightAnchor),
                messageLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
            ]
        )
    }
    
    // MARK: ViewState
    
    func setView(with viewState: ViewState?) {
        guard let viewState = viewState else { return }
        switch viewState {
        case .loading:
            tableView.isHidden = true
            basketView.isHidden = true
            messageLabel.isHidden = false
            messageLabel.text = "Loading"
        case .empty:
            tableView.isHidden = true
            basketView.isHidden = true
            messageLabel.isHidden = false
            messageLabel.text = "Empty"
        case .error(_):
            tableView.isHidden = true
            basketView.isHidden = true
            messageLabel.isHidden = false
            messageLabel.text = "error"
        case .success:
            tableView.isHidden = false
            basketView.isHidden = false
            messageLabel.isHidden = true
        }
    }
}

private enum Subviews {
    
    static var tableView: UITableView {
        let tableView: UITableView = UITableView()
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.register(BasketProductViewCell.self)
        return tableView
    }

    static var currencyPickerView: UIPickerView {
        let currencyPickerView: UIPickerView = UIPickerView()
        currencyPickerView.reloadAllComponents()
        return currencyPickerView
    }
    
    static var amountLabel: UILabel {
        let amountLabel: UILabel = UILabel()
        amountLabel.font = UIFont.systemFont(ofSize: 20.0, weight: .bold)
        amountLabel.text = "0.0"
        return amountLabel
    }
    
    static var messageLabel: UILabel {
        let messageLabel: UILabel = UILabel()
        messageLabel.font = UIFont.systemFont(ofSize: 20.0, weight: .bold)
        messageLabel.textAlignment = .center
        return messageLabel
    }
    
    static var basketView: UIView {
        let basketView: UIView = UIView()
        basketView.backgroundColor = .lightGray
        return basketView
    }
    
    static var closeBasketButton: GenericButton {
        let closeBasketButton: GenericButton = GenericButton()
        closeBasketButton.setTitle("Close basket", for: .normal)
        closeBasketButton.backgroundColor = .systemGreen
        return closeBasketButton
    }
}
