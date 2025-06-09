import SwiftUI
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        
        //MARK: SwiftUI based approach:
        let rootSwiftUIView = StocksLandingPageSwiftUIView(viewModel: StocksLandingPageSwiftUIViewModel(
            stocks: Stock.demoStocks,
            stockService: StockPriceUpdateService()
        ))
        let hostingController = UIHostingController(rootView: rootSwiftUIView)
        
        window.rootViewController = hostingController
        
        //MARK: UIKit based approach
//        let vc = StockListViewController(viewModel: StockListViewModel())
//        let vcV2 = StocksLandingPageVC(
//            viewModel: StocksLandingPageViewModel(
//                stocks: Stock.demoStocks,
//                stockService: StockPriceUpdateService()
//            )
//        )
        
//        window.rootViewController = UINavigationController(rootViewController: vcV2)
        window.makeKeyAndVisible()
    }
}
