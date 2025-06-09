//
//  StocksLandingPageViewModel.swift
//  StockViewer
//
//  Created by Raul Sulaimanov on 09.06.25.
//

import Foundation

final class StocksLandingPageViewModel {
    var stocks: [Stock] = []
    var prices: [String: Double] = [:]
    
    private let stockService: StockPriceUpdateService
    init(
        stocks: [Stock],
        stockService: StockPriceUpdateService
    ) {
        self.stocks = stocks
        self.stockService = stockService
    }
}

extension StocksLandingPageViewModel {
    func startUpdatingPrices(_ onPriceUpdate: @escaping () -> Void) {
        stocks.forEach { stock in
            stockService.subscribe(stockId: stock.stockId) { [weak self] priceUpdate in
                guard let self = self else { return }
                let price = (priceUpdate.currentPrice as NSDecimalNumber).doubleValue
                self.prices[stock.stockId] = price
                onPriceUpdate()
            }
        }
    }
}
