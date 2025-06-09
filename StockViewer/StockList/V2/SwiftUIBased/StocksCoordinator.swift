//
//  CoordinatorV2.swift
//  StockViewer
//
//  Created by Raul Sulaimanov on 09.06.25.
//

import Combine
import SwiftUI

enum StocksRoute: Hashable {
    case details(Stock)
    case news(Stock)
}

final class StocksCoordinator: ObservableObject {
    @Published var path = NavigationPath()
    
    func showDetails(for stock: Stock) {
        path.append(StocksRoute.details(stock))
    }
    
    func showNews(for stock: Stock) {
        path.append(StocksRoute.news(stock))
    }
}
