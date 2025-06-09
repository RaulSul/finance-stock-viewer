//
//  StocksLandingPage.swift
//  StockViewer
//
//  Created by Raul Sulaimanov on 09.06.25.
//

import UIKit

final class StocksLandingPageView: UIView {
    var titleView: UIView = {
        let view = UITextView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.textAlignment = .center
        view.textColor = .black
        view.font = .systemFont(ofSize: 18, weight: .bold)
        view.text = "Stocks"
        view.backgroundColor = .red
        
        return view
    }()
    
    var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.clipsToBounds = true
        searchBar.placeholder = "Search for stocks..."
        
        return searchBar
    }()
    
    var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout
        )
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.clipsToBounds = true
        collectionView.backgroundColor = .green
        collectionView.register(
            StocksCollectionCell.self,
            forCellWithReuseIdentifier: StocksCollectionCell.reuseIdentifier
        )
        
        return collectionView
    }()
    
    init() {
        super.init(frame: .zero)
        
        setupUI()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension StocksLandingPageView {
    func setupUI() {
        translatesAutoresizingMaskIntoConstraints = false
        clipsToBounds = true
        
        let stackView: UIStackView = {
            let stackView = UIStackView()
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.clipsToBounds = true
            stackView.axis = .vertical
            stackView.spacing = 8
            stackView.alignment = .center
            return stackView
        }()
        
        addSubview(stackView)
        
        stackView.addArrangedSubview(titleView)
        stackView.addArrangedSubview(searchBar)
        stackView.addArrangedSubview(collectionView)
        
        stackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        titleView.heightAnchor.constraint(equalToConstant: 28).isActive = true
        titleView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 8).isActive = true
        titleView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -8).isActive = true
        
        searchBar.heightAnchor.constraint(lessThanOrEqualToConstant: 40).isActive = true
        searchBar.widthAnchor.constraint(equalTo: stackView.widthAnchor, constant: -16).isActive = true
        
        collectionView.widthAnchor.constraint(equalTo: stackView.widthAnchor, constant: -16).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: stackView.bottomAnchor).isActive = true
    }
}
