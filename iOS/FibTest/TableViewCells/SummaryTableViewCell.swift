//
//  SummaryTableViewCell.swift
//  FibTest
//
//  Created by Pedro Freddi on 23/06/25.
//

import Foundation
import UIKit

class SummaryTableViewCell: UITableViewCell {

    // MARK: Properties

    let stackView: UIStackView = {
        let stackview = UIStackView()
        stackview.alignment = .fill
        stackview.spacing = 8
        stackview.distribution = .fillProportionally
        stackview.axis = .horizontal
        stackview.translatesAutoresizingMaskIntoConstraints = false
        return stackview
    }()

    let calculatedTermLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.textColor = .label
        textLabel.font = .systemFont(ofSize: 17, weight: .medium)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        return textLabel
    }()

    let timeElapsedLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.textColor = .label
        textLabel.textAlignment = .right
        textLabel.font = .systemFont(ofSize: 17, weight: .medium)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        return textLabel
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        stackView.addArrangedSubview(calculatedTermLabel)
        stackView.addArrangedSubview(timeElapsedLabel)
        contentView.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
    }

    func setupCell(_ previousSequence: PreviousCalculation) {
        calculatedTermLabel.text = previousSequence.input
        timeElapsedLabel.text = previousSequence.timeElapsed
    }
}
