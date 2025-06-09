//
//  StockDetailsSwiftUIView.swift
//  StockViewer
//
//  Created by Raul Sulaimanov on 09.06.25.
//

import SwiftUI

struct StockDetailsSwiftUIView: View {
    @ObservedObject var viewModel: StockDetailsViewModel
    
    var body: some View {
        main()
    }
}

private extension StockDetailsSwiftUIView {
    @ViewBuilder
    func main() -> some View {
        VStack {
            Text("Name: " + viewModel.stock.name)
                .font(.title)
            
            Text("ID: " + String(viewModel.stock.stockId))
            
            Button("See News") {
                viewModel.seeNews()
            }
            
            Spacer()
        }
    }
}


final class StockNewsViewModel: ObservableObject {
    let stock: Stock

    init(stock: Stock) {
        self.stock = stock
    }
}

struct StockNewsView: View {
    @ObservedObject var viewModel: StockNewsViewModel

    var body: some View {
        Text("News for \(viewModel.stock.name)")
            .font(.headline)
            .navigationTitle("News")
    }
}
