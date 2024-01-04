import XCTest
@testable import StockViewer

class StockPriceUpdateServiceTests: XCTestCase {
    var service: StockPriceUpdateService!
    var expectation: XCTestExpectation!
    
    override func setUp() {
        super.setUp()
        service = StockPriceUpdateService()
        expectation = XCTestExpectation(description: "StockUpdateReceived")
    }
    
    override func tearDown() {
        service = nil
        super.tearDown()
    }
    
    func testSubscriptionReceivesUpdate() {
        let stockId = "TestStockID"
        service.subscribe(stockId: stockId) { update in
            XCTAssertEqual(update.stockId, stockId)
            self.expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testUnsubscriptionStopsUpdates() {
        func testUnsubscriptionStopsUpdates() {
            let stockId = "TestStockID"
            var updateCount = 0
            
            service.subscribe(stockId: stockId) { _ in
                updateCount += 1
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                self.service.unsubscribe(stockId: stockId)
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                XCTAssertEqual(updateCount, 1, "Expected only one update before unsubscription")
                self.expectation.fulfill()
            }
            
            wait(for: [expectation], timeout: 5.0)
        }
    }
}
