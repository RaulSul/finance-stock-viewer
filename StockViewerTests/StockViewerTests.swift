import XCTest
@testable import StockViewer

class MockStockPriceUpdateService: StockPriceUpdateService {
    var updateCount = 0
    var completion: (() -> Void)?

    override func subscribe(
        stockId: String,
        listener: @escaping (StockPriceUpdate) -> Void
    ) {
        // Call listener immediately for testing purposes
        listener(StockPriceUpdate(
            stockId: stockId,
            currentPrice: Decimal(100),
            openPrice: Decimal(90)
        ))
        updateCount += 1
        if updateCount == Stock.demoStocks.count {
            completion?()
        }
    }
}

class StockListViewModelTests: XCTestCase {
    var mockService: MockStockPriceUpdateService!
    var viewModel: StockListViewModel!
    
    override func setUp() {
        super.setUp()
        mockService = MockStockPriceUpdateService()
        viewModel = StockListViewModel(stockPriceService: mockService)
    }
    
    override func tearDown() {
        viewModel = nil
        mockService = nil
        super.tearDown()
    }
    
    func testStartUpdates() {
        let expectation = self.expectation(description: "PriceUpdate")

        mockService?.completion = {
            XCTAssertEqual(self.viewModel.prices.count, Stock.demoStocks.count)
            XCTAssertNotNil(self.viewModel.prices.first?.value)
            expectation.fulfill()
        }

        viewModel.startUpdates {}

        waitForExpectations(timeout: 1)
    }
}

