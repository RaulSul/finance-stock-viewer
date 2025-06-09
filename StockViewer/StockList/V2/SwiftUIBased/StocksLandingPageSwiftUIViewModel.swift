//
//  StocksLandingPageSwiftUIViewModel.swift
//  StockViewer
//
//  Created by Raul Sulaimanov on 09.06.25.
//

import Foundation

final class StocksLandingPageSwiftUIViewModel: ObservableObject {
    @Published var stocks: [Stock] = []
    @Published var prices: [String: Double] = [:]
    
    private let stockService: StockPriceUpdateService
    init(
        stocks: [Stock],
        stockService: StockPriceUpdateService
    ) {
        self.stocks = stocks
        self.stockService = stockService
        startUpdatingPrices()
    }
}

private extension StocksLandingPageSwiftUIViewModel {
    func startUpdatingPrices() {
        stocks.forEach { stock in
            stockService.subscribe(stockId: stock.stockId) { [weak self] priceUpdate in
                guard let self = self else { return }
                let price = (priceUpdate.currentPrice as NSDecimalNumber).doubleValue
                DispatchQueue.main.async {
                    self.prices[stock.stockId] = price
                }
            }
        }
    }
}
