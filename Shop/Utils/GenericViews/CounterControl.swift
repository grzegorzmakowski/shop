//
//  CounterControl.swift
//  Shop
//
//  Created by Grzegorz Makowski on 01/01/2020.
//  Copyright © 2020 Grzegorz Makowski. All rights reserved.
//

import UIKit

final class CounterControl: UIView {
    
    typealias Listener = ((Int) -> Void)
    
    // MARK: Properties
    
    private let container: UIStackView = Subviews.container
    private let plusButton: GenericButton = Subviews.plusButton
    private let minusButton: GenericButton = Subviews.minusButton
    private let counterLabel: UILabel = Subviews.countLabel
    
    private let value: Observable<Int> = Observable<Int>(value: 0)
    
    // MARK: Initialization
    
    init() {
        super.init(frame: .zero)
        setupLayout()
        setupControl()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    // MARK: Setup
    
    private func setupLayout() {
        addSubview(container)
        container.constraintAllEdges(to: self, with: .zero)
        
        container.addArrangedSubview(minusButton)
        container.addArrangedSubview(counterLabel)
        container.addArrangedSubview(plusButton)
        
        minusButton.activate(
            [
                minusButton.heightAnchor.constraint(equalToConstant: 44.0),
                minusButton.widthAnchor.constraint(equalToConstant: 44.0)
            ]
        )
        
        plusButton.activate(
            [
                plusButton.heightAnchor.constraint(equalToConstant: 44.0),
                plusButton.widthAnchor.constraint(equalToConstant: 44.0)
            ]
        )
        
        counterLabel.activate(
            [
                counterLabel.widthAnchor.constraint(equalToConstant: 44.0)
            ]
        )
    }
    
    private func setupControl() {
        minusButton.clickClosure = { [weak self] in
            guard let self = self else { return }
            guard self.value.value > 0 else { return }
            let newValue = self.value.value - 1
            self.counterLabel.text = "\(newValue)"
            self.value.value = newValue
        }
        
        plusButton.clickClosure = { [weak self] in
            guard let self = self else { return }
            let newValue = self.value.value + 1
            self.counterLabel.text = "\(newValue)"
            self.value.value = newValue
        }
    }
    
    // MARK: Binding
    
    func bind(_ listener: Listener?) {
        value.bind(listener)
    }
    
    func unbind() {
        value.unbind()
    }
}

private enum Subviews {
    
    static var container: UIStackView {
        let container: UIStackView = UIStackView()
        container.axis = .horizontal
        return container
    }
    
    static var plusButton: GenericButton {
        let plusButton: GenericButton = GenericButton()
        plusButton.setImage(UIImage(named: "plus"), for: .normal)
        return plusButton
    }
    
    static var minusButton: GenericButton {
        let minusButton: GenericButton = GenericButton()
        minusButton.setImage(UIImage(named: "minus"), for: .normal)
        return minusButton
    }
    
    static var countLabel: UILabel {
        let countLabel: UILabel = UILabel()
        countLabel.text = "0"
        countLabel.textAlignment = .center
        countLabel.font = UIFont.systemFont(ofSize: 14.0, weight: .semibold)
        return countLabel
    }
}
