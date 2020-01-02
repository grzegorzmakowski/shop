//
//  BasketProductViewCell.swift
//  Shop
//
//  Created by Grzegorz Makowski on 30/12/2019.
//  Copyright © 2019 Grzegorz Makowski. All rights reserved.
//

import UIKit

final class BasketProductViewCell: UITableViewCell, CellConfigurable {
    
    typealias T = BasketProductViewCellViewModel
    
    // MARK: Properties
    
    weak var viewModel: BasketProductViewCellViewModel?
    
    private let mainContainer: UIStackView = Subviews.mainContainer
    private let carImageView: UIImageView = Subviews.carImageView
    private let labelStackContainer: UIStackView = Subviews.labelStackContainer
    private let nameCarTitleLabel: UILabel = Subviews.nameCarTitleLabel
    private let priceTitleLabel: UILabel = Subviews.priceTitleLabel
    private let counterControl: CounterControl = Subviews.counterControl
    private var imageHeight: CGFloat { return 80.0 }
    
    // MARK: Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
        setupImageView()
        backgroundColor = .systemGreen
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    // MARK: Setup
    
    private func setupLayout() {
        contentView.addSubview(mainContainer)
        let margins: UIEdgeInsets = .init(top: Layout.margin.small,
                                          left: Layout.margin.small,
                                          bottom: Layout.margin.small,
                                          right: Layout.margin.small)
        mainContainer.constraintAllEdges(to: contentView, with: margins)
        
        mainContainer.addArrangedSubview(carImageView)
        mainContainer.addArrangedSubview(labelStackContainer)
        mainContainer.addArrangedSubview(counterControl)
        
        labelStackContainer.addArrangedSubview(nameCarTitleLabel)
        labelStackContainer.addArrangedSubview(priceTitleLabel)
        
        carImageView.activate(
            [
                carImageView.heightAnchor.constraint(equalToConstant: imageHeight),
                carImageView.widthAnchor.constraint(equalToConstant: imageHeight)
            ]
        )
    }
    
    private func setupImageView() {
        carImageView.layer.borderWidth = 1.0
        carImageView.layer.masksToBounds = false
        carImageView.layer.borderColor = UIColor.green.cgColor
        carImageView.layer.cornerRadius = imageHeight / 2.0
        carImageView.clipsToBounds = true
    }
    
    // MARK: Reuse
    
    override func prepareForReuse() {
        super.prepareForReuse()
        carImageView.image = nil
        viewModel = nil
        counterControl.unbind()
    }
    
    // MARK: Binding
    
    func bind(_ viewModel: BasketProductViewCellViewModel) {
        self.viewModel = viewModel
        nameCarTitleLabel.text = viewModel.name
        priceTitleLabel.text = viewModel.formattedPrice
        carImageView.image = viewModel.image
        counterControl.bind { [weak self] quantity in
            self?.viewModel?.setQuantity(quantity)
        }
    }
}

private enum Subviews {
    
    static var mainContainer: UIStackView {
        let mainContainer: UIStackView = UIStackView()
        mainContainer.translatesAutoresizingMaskIntoConstraints = false
        mainContainer.spacing = Layout.margin.normal
        mainContainer.alignment = .center
        mainContainer.axis = .horizontal
        return mainContainer
    }
    
    static var carImageView: UIImageView {
        let carImageView: UIImageView = UIImageView()
        carImageView.contentMode = .scaleAspectFill
        carImageView.translatesAutoresizingMaskIntoConstraints = false
        return carImageView
    }
    
    static var labelStackContainer: UIStackView {
        let labelStackContainer: UIStackView = UIStackView()
        labelStackContainer.translatesAutoresizingMaskIntoConstraints = false
        labelStackContainer.axis = .vertical
        labelStackContainer.spacing = Layout.margin.small
        labelStackContainer.isLayoutMarginsRelativeArrangement = true
        labelStackContainer.layoutMargins = .init(top: Layout.margin.small,
                                                  left: .zero,
                                                  bottom: Layout.margin.big,
                                                  right: .zero)
        return labelStackContainer
    }
    
    static var nameCarTitleLabel: UILabel {
        let nameCarTitleLabel: UILabel = UILabel()
        nameCarTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        nameCarTitleLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
        return nameCarTitleLabel
    }
    
    static var priceTitleLabel: UILabel {
        let priceTitleLabel: UILabel = UILabel()
        priceTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        priceTitleLabel.font = UIFont.italicSystemFont(ofSize: 14.0)
        return priceTitleLabel
    }
    
    static var counterControl: CounterControl {
        return CounterControl()
    }
}
