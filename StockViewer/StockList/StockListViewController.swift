import UIKit

final class StockListViewController: UIViewController {
    let viewModel: StockListViewModel
    private lazy var tableView: UITableView = createTableView()

    init(viewModel: StockListViewModel = StockListViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        bindViewModel()
    }

    private func setupView() {
        title = "My Stocks"
        view.addSubview(tableView)
    }

    private func bindViewModel() {
        viewModel.startUpdates { [weak self] in
            self?.tableView.reloadData()
        }
    }

    private func createTableView() -> UITableView {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(StockListCell.self, forCellReuseIdentifier: "StockListCell")
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        tableView.frame = view.bounds
        return tableView
    }
}

// MARK: - UITableViewDataSource
extension StockListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.stocks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StockListCell", for: indexPath)
        configure(cell: cell, forRowAt: indexPath)
        return cell
    }

    private func configure(cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let stockListCell = cell as? StockListCell else { return }

        let stock = viewModel.stocks[indexPath.row]
        stockListCell.nameLabel.text = stock.name
        
        let price = viewModel.prices[stock.stockId] ?? 0.0
        stockListCell.priceLabel.text = String(format: "%.2f €", price)
    }
}

// MARK: - UITableViewDelegate
extension StockListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        #if DEBUG
        print("selected", indexPath)
        #endif
    }
}
