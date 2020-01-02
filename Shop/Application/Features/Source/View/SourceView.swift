//
//  SourceView.swift
//  Shop
//
//  Created by Grzegorz Makowski on 01/01/2020.
//  Copyright © 2020 Grzegorz Makowski. All rights reserved.
//

import UIKit

final class SourceView: UIView {
    
    // MARK: Properties
    
    let buttonContainer: UIStackView = Subviews.buttonContainer
    let offlineSourceButton: GenericButton = Subviews.offlineSourceButton
    let onlineSourceButton: GenericButton = Subviews.onlineSourceButton
    
    // MARK: Initialization
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    // MARK: Setup
    
    private func setupLayout() {
        addSubview(buttonContainer)
        buttonContainer.activate(
            [
                buttonContainer.centerYAnchor.constraint(equalTo: centerYAnchor),
                buttonContainer.leftAnchor.constraint(equalTo: leftAnchor),
                buttonContainer.rightAnchor.constraint(equalTo: rightAnchor)
            ]
        )
        
        buttonContainer.addArrangedSubview(offlineSourceButton)
        buttonContainer.addArrangedSubview(onlineSourceButton)
    }
}

fileprivate enum Subviews {
    
    static var buttonContainer: UIStackView {
        let buttonContainer: UIStackView = UIStackView()
        buttonContainer.axis = .vertical
        buttonContainer.spacing = Layout.margin.big
        return buttonContainer
    }
    
    static var offlineSourceButton: GenericButton {
        let offlineSourceButton: GenericButton = GenericButton()
        offlineSourceButton.backgroundColor = .systemRed
        offlineSourceButton.setTitle("Offline source", for: .normal)
        return offlineSourceButton
    }
    
    static var onlineSourceButton: GenericButton {
        let onlineSourceButton: GenericButton = GenericButton()
        onlineSourceButton.backgroundColor = .systemGreen
        onlineSourceButton.setTitle("Online source", for: .normal)
        return onlineSourceButton
    }
}
