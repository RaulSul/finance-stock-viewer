import Foundation


class StockListViewModel {
    var stocks: [Stock] = []
    var prices: [String: Double] = [:]  // Changed to a dictionary after all
    
    private let stockPriceService: StockPriceUpdateService

    init(
        stocks: [Stock] = Stock.demoStocks,
        stockPriceService: StockPriceUpdateService = StockPriceUpdateService()
    ) {
        self.stocks = stocks
        self.stockPriceService = stockPriceService
    }
    
    func startUpdates(closure: @escaping (() -> Void)) {
        stocks.forEach { stock in
            subscribeToStockPrice(stock: stock, closure: closure)
        }
    }
    
    private func subscribeToStockPrice(stock: Stock, closure: @escaping (() -> Void)) {
        stockPriceService.subscribe(stockId: stock.stockId) { [weak self] priceUpdate in
            guard let self = self else { return }
            let price = (priceUpdate.currentPrice as NSDecimalNumber).doubleValue
            self.prices[stock.stockId] = price
            closure()
        }
    }
}

