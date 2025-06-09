//
//  StocksLandingPageSwiftUIViewModel.swift
//  StockViewer
//
//  Created by Raul Sulaimanov on 09.06.25.
//

import Foundation

final class StocksLandingPageSwiftUIViewModel: ObservableObject {
    @Published var stocks: [Stock]
    @Published var prices: [String: Double] = [:]

    private let stockService: StockPriceUpdateService
    private weak var coordinator: StocksCoordinator?

    init(stocks: [Stock] = Stock.demoStocks,
         stockService: StockPriceUpdateService = .init(),
         coordinator: StocksCoordinator
    ) {
        self.stocks = stocks
        self.stockService = stockService
        self.coordinator = coordinator
        startUpdatingPrices()
    }

    func didTapStock(_ stock: Stock) {
        coordinator?.showDetails(for: stock)
    }

    private func startUpdatingPrices() {
        stocks.forEach { stock in
            stockService.subscribe(stockId: stock.stockId) { [weak self] update in
                let price = (update.currentPrice as NSDecimalNumber).doubleValue
                DispatchQueue.main.async {
                    self?.prices[stock.stockId] = price
                }
            }
        }
    }
}
