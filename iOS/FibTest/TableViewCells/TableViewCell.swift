//
//  FirstPageTableViewCell.swift
//  FibTest
//
//  Created by James Nguyen (JTN) on 5/2/19.
//  Copyright © 2019 James Nguyen (JTN). All rights reserved.
//

import Foundation
import UIKit

class FirstPageTableViewCell: UITableViewCell {

    // MARK: - Properties

    let stackView: UIStackView = {
        let stackview = UIStackView()
        stackview.alignment = .fill
        stackview.spacing = 8
        stackview.distribution = .fillProportionally
        stackview.axis = .horizontal
        stackview.translatesAutoresizingMaskIntoConstraints = false
        return stackview
    }()

    let termIndexLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.textColor = .label
        textLabel.font = .systemFont(ofSize: 17, weight: .medium)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        return textLabel
    }()

    let termValueLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.textColor = .label
        textLabel.textAlignment = .right
        textLabel.font = .systemFont(ofSize: 17, weight: .medium)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        return textLabel
    }()

    // MARK: - Factory

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupCell(termIndex: Int, termValue: Decimal) {
        termIndexLabel.text = "\(termIndex)"
        termValueLabel.text = "\(termValue)"
    }

    private func setupViews() {
        stackView.addArrangedSubview(termIndexLabel)
        stackView.addArrangedSubview(termValueLabel)
        contentView.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
    }
}
