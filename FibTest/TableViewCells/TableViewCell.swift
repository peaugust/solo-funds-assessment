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

    // MARK: Properties

    let resultLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        textLabel.textColor = .label
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
        contentView.addSubview(resultLabel)

        NSLayoutConstraint.activate([
            resultLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            resultLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            resultLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            resultLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
    }

    func setupCell(termIndex: Int, termValue: Decimal) {
        resultLabel.text = "\(termIndex): \(termValue)"
    }

}
