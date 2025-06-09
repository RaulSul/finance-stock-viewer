import Foundation

class StockPriceUpdateService {
    private var timers: [String: Timer] = [:]
    private let returnQueue = DispatchQueue.main

    func subscribe(stockId: String, listener: @escaping (StockPriceUpdate) -> Void) {
        unsubscribe(stockId: stockId) // Cancel any existing subscription

        let openPrice = Decimal(Double.random(in: 20.0...200.0))
        var lastPrice = openPrice

        let timer = Timer(timeInterval: .random(in: 0.5...2.0), repeats: true) { [weak self] _ in
            guard let self = self else { return }
            let currentPrice = lastPrice + lastPrice * Decimal(Double.random(in: -0.01...0.01))
            lastPrice = currentPrice
            self.returnQueue.async {
                listener(
                    StockPriceUpdate(
                        stockId: stockId,
                        currentPrice: currentPrice,
                        openPrice: openPrice)
                )
            }
        }
        timer.tolerance = 0.01
        RunLoop.main.add(timer, forMode: .common)

        timers[stockId] = timer
    }

    private func unsubscribe(stockId: String) {
        timers[stockId]?.invalidate()
        timers[stockId] = nil
    }
}
