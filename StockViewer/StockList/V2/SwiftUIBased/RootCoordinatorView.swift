//
//  RootCoordinatorView.swift
//  StockViewer
//
//  Created by Raul Sulaimanov on 09.06.25.
//

import Combine
import SwiftUI

struct RootCoordinatorView: View {
    @StateObject var coordinator = StocksCoordinator()
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            let vm = StocksLandingPageSwiftUIViewModel(
                stocks: Stock.demoStocks,
                stockService: StockPriceUpdateService(),
                coordinator: coordinator
            )
            
            StocksLandingPageSwiftUIView(viewModel: vm)
                .navigationDestination(for: StocksRoute.self) { route in
                    switch route {
                    case .details(let stock):
                        StockDetailsSwiftUIView(
                            viewModel: .init(stock: stock, coordinator: coordinator)
                        )
                    case .news(_):
                        EmptyView()
                    }
                }
        }
    }
}
