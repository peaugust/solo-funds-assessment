//
//  CalculationScreenViewController.swift
//  FibTest
//
//  Created by Pedro Freddi on 22/06/25.
//  Copyright © 2025 James Nguyen (JTN). All rights reserved.
//

import UIKit

class CalculationScreenViewController: UIViewController {

    // MARK: - Factory

    init(viewModel: CalculationScreenViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.title = "FibTest"
        self.viewModel.output = self
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Properties

    private var viewModel: CalculationScreenViewModel

    // MARK: - UI Components

    lazy var summaryButton: UIBarButtonItem = {
        let summaryButton = UIBarButtonItem(title: "Summary", primaryAction: UIAction { [weak self] _ in
            self?.viewModel.navigateToSumary()
        })
        return summaryButton
    }()

    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Type a number to calculate the Fibonacci"
        textField.borderStyle = .roundedRect
        textField.keyboardType = .numberPad
        var doneToolbar: UIToolbar = UIToolbar(frame: CGRectMake(0, 0, 320, 50))
        var flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        var done: UIBarButtonItem = UIBarButtonItem(title: "Done", primaryAction: UIAction {[weak self] _ in
            self?.viewModel.submit(textField.text ?? "")
            textField.resignFirstResponder()
        })

        var items = [flexSpace, done]
           doneToolbar.items = items
           doneToolbar.sizeToFit()
        textField.inputAccessoryView = doneToolbar
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(FirstPageTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()

    let timeElapsedLabel: UILabel = {
        let timeElapsedLabel = UILabel()
        timeElapsedLabel.translatesAutoresizingMaskIntoConstraints = false
        return timeElapsedLabel
    }()

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.rightBarButtonItem = summaryButton
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationItem.rightBarButtonItem = nil
    }

    private func setupViews() {
        self.view.addSubview(textField)
        self.view.addSubview(tableView)
        self.view.addSubview(timeElapsedLabel)
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            tableView.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 8),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: timeElapsedLabel.topAnchor),
            timeElapsedLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            timeElapsedLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            timeElapsedLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

}

extension CalculationScreenViewController: CalculationViewModelOutput {
    func didCalculateSequence() {
        tableView.reloadData()
        guard let timeElapsed = viewModel.calculatedSequence?.timeElapsed else { return }
        timeElapsedLabel.text = String(format: "Time elapsed: \(timeElapsed)")
    }
}

extension CalculationScreenViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.calculatedSequence?.sequence.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? FirstPageTableViewCell, let sequence = viewModel.calculatedSequence?.sequence else { return UITableViewCell() }
        cell.setupCell(termIndex: indexPath.row, termValue: sequence[indexPath.row])
        return cell
    }
}


extension CalculationScreenViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
}
