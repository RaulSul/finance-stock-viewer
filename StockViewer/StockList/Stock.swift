import Foundation

struct Stock: Hashable {
    let stockId: String
    let name: String
}

extension Stock {
    static let demoStocks: [Stock] = [
        Stock(stockId: "US0378331005", name: "Apple"),
        Stock(stockId: "US88160R1014", name: "Tesla"),
        Stock(stockId: "US5949181045", name: "Microsoft")
    ]
}
