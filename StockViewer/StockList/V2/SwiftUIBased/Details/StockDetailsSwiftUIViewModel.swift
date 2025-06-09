//
//  StockDetailsSwiftUIViewModel.swift
//  StockViewer
//
//  Created by Raul Sulaimanov on 09.06.25.
//

import SwiftUI

final class StockDetailsViewModel: ObservableObject {
    let stock: Stock
    private weak var coordinator: StocksCoordinator?

    init(stock: Stock, coordinator: StocksCoordinator) {
        self.stock = stock
        self.coordinator = coordinator
    }

    func seeNews() {
        coordinator?.showNews(for: stock)
    }
}
