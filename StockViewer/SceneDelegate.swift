import SwiftUI
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        //MARK: SwiftUI based approach:
        let rootView = RootCoordinatorView()
        
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = UIHostingController(rootView: rootView)
        self.window = window
        
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
