//
//  StocksLandingPageSwiftUIView.swift
//  StockViewer
//
//  Created by Raul Sulaimanov on 09.06.25.
//

import SwiftUI

struct StocksLandingPageSwiftUIView: View {
    @ObservedObject var viewModel: StocksLandingPageSwiftUIViewModel
    
    var body: some View {
        main()
    }
}

private extension StocksLandingPageSwiftUIView {
    @ViewBuilder
    func main() -> some View {
        VStack {
            Text("My Stocks")
                .font(.headline)
                .foregroundColor(.black)
                .padding(.top, 8)
                .padding(.horizontal, 16)
            
            stocksSection()
                .padding(.top, 8)
                .padding(.horizontal, 16)
            
            Spacer()
        }
    }
    
    @ViewBuilder
    func stocksSection() -> some View {
        ScrollView(.vertical) {
            VStack {
                dividerLine()
                
                ForEach(viewModel.stocks, id: \.self) { stock in
                    HStack {
                        Text(stock.name)
                            .font(.body)
                        
                        var text: String {
                            if let price = viewModel.prices[stock.stockId] {
                                return String(format: "%.2f$", price)
                            } else {
                                return "n/a"
                            }
                        }
                        
                        Spacer()
                        
                        Text(text)
                            .font(.body)
                            .padding(.trailing, 16)
                        
                    }
                    
                    dividerLine()
                }
            }
        }
    }
    
    @ViewBuilder
    func dividerLine() -> some View {
        Color.gray
            .opacity(0.5)
            .frame(
                width: .infinity,
                height: 1
            )
    }
}
