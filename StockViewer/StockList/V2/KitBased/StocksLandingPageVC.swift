import UIKit

final class StocksLandingPageVC: UIViewController {
    let viewModel: StocksLandingPageViewModel
    
    private var landingPage: StocksLandingPageView = StocksLandingPageView()
    
    init(viewModel: StocksLandingPageViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLandingPage()
    }
}

private extension StocksLandingPageVC {
    func setupLandingPage() {
        landingPage.collectionView.delegate = self
        landingPage.collectionView.dataSource = self
        
        viewModel.startUpdatingPrices { [weak self] in
            self?.landingPage.collectionView.reloadData()
        }
        
        view.addSubview(landingPage)
        
        landingPage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        landingPage.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        landingPage.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        landingPage.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}

//MARK: Collection View Methods
extension StocksLandingPageVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.stocks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: StocksCollectionCell.reuseIdentifier,
            for: indexPath
        ) as? StocksCollectionCell
        else {
            fatalError("Unable to dequeue StocksCollectionCell")
        }
        
        let stock = viewModel.stocks[indexPath.item]
        let price = viewModel.prices[stock.stockId] ?? 0.0
        cell.configure(name: stock.name, price: String(format: "%.2f €", price))
        
        return cell
    }
}

extension StocksLandingPageVC: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 44)
    }
}
