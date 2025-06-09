//
//  StocksCollectionCell.swift
//  StockViewer
//
//  Created by Raul Sulaimanov on 09.06.25.
//

import UIKit

final class StocksCollectionCell: UICollectionViewCell {
    static let reuseIdentifier = "StocksCollectionCell"
    
    let titleLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.textColor = .label
        view.font = .systemFont(ofSize: 16, weight: .medium)
        
        return view
    }()
    
    let priceLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.textColor = .label
        view.font = .systemFont(ofSize: 16, weight: .medium)
        
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension StocksCollectionCell {
    func configure(name: String, price: String) {
        titleLabel.text = name
        priceLabel.text = price
    }
}

private extension StocksCollectionCell {
    func setupViews() {
        let horizontalStack: UIStackView = {
            let view = UIStackView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.clipsToBounds = true
            view.axis = .horizontal
            view.spacing = 8
            view.alignment = .leading
            
            return view
        }()
        
        addSubview(horizontalStack)
        
        horizontalStack.addArrangedSubview(titleLabel)
        horizontalStack.addArrangedSubview(priceLabel)
        
        horizontalStack.topAnchor.constraint(equalTo: topAnchor).isActive = true
        horizontalStack.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        horizontalStack.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        horizontalStack.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        titleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        titleLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 100).isActive = true
        
        priceLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        priceLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 100).isActive = true
    }
}
