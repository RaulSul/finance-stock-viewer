import UIKit

final class StockListCell: UITableViewCell {

    let nameLabel = UILabel()
    let priceLabel = UILabel()

    private let horizontalMargin: CGFloat = 16
    private let verticalMargin: CGFloat = 10
    private let spacingBetweenLabels: CGFloat = 8

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        configureLabels()
        setupStackView()
    }

    private func configureLabels() {
        nameLabel.font = UIFont.systemFont(ofSize: 16)
        nameLabel.accessibilityIdentifier = "nameLabel"
        priceLabel.font = UIFont.systemFont(ofSize: 14)
        priceLabel.accessibilityIdentifier = "priceLabel"
    }

    private func setupStackView() {
        let stackView = UIStackView(arrangedSubviews: [nameLabel, priceLabel])
        stackView.axis = .horizontal
        stackView.spacing = spacingBetweenLabels
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: verticalMargin, left: horizontalMargin, bottom: verticalMargin, right: horizontalMargin)
        contentView.addSubview(stackView)

        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}

