//
//  CalculationScreenViewModel.swift
//  FibTest
//
//  Created by Pedro Freddi on 22/06/25.
//  Copyright © 2025 James Nguyen (JTN). All rights reserved.
//

import Foundation
import UIKit

protocol CalculationScreenProtocol {
    var calculatedSequence: [Decimal] { get }
    func submit(_ input: String)
    func calculateSequence(term: Int) -> [Decimal]
    func navigateToSumary()
}

protocol CalculationViewModelOutput: AnyObject {
    func didCalculateSequence()
}

class CalculationScreenViewModel: CalculationScreenProtocol {
    // MARK: - Factory

    init(navController: UINavigationController) {
        self.navController = navController
    }

    // MARK: - Properties
    weak var output: CalculationViewModelOutput?
    var navController: UINavigationController?
    var calculatedSequence: [Decimal] = []
    var timeElapsed: Int = 0

    // MARK: - Actions

    func calculateSequence(term: Int) -> [Decimal] {
        var fibSequence: [Decimal] = []

        var firstPreviousTerm: Decimal = 0
        var secondPreviousTerm: Decimal = 1

        for currentTerm in 0...term {
            if currentTerm == 0 {
                fibSequence.append(firstPreviousTerm)
            } else if currentTerm == 1 {
                fibSequence.append(secondPreviousTerm)
            } else {
                let nextValue = firstPreviousTerm + secondPreviousTerm
                firstPreviousTerm = secondPreviousTerm
                secondPreviousTerm = nextValue
                fibSequence.append(nextValue)
            }
        }

        return fibSequence
    }


    func submit(_ input: String) {
        guard let term = Int(input) else { return }
        calculatedSequence = calculateSequence(term: term)
        output?.didCalculateSequence()
    }

    func navigateToSumary() {
        let viewModel = SummaryViewModel()
        let viewController = SummaryViewController(viewModel: viewModel)
        navController?.pushViewController(viewController, animated: true)
    }
}

