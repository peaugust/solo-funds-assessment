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
    var calculatedSequence: CalculationResult? { get }
    func submit(_ input: String)
    func calculateSequence(term: Int) -> CalculationResult
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
    var calculatedSequence: CalculationResult?
    var timeElapsed: String = ""
    var pastCalculations: [PreviousCalculation] = []

    // MARK: - Actions

    func calculateSequence(term: Int) -> CalculationResult {
        var fibSequence: [Decimal] = []

        var firstPreviousTerm: Decimal = 0
        var secondPreviousTerm: Decimal = 1
        let clock = ContinuousClock()
        let duration = clock.measure {
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
        }
        return CalculationResult(sequence: fibSequence, timeElapsed: duration.description)
    }


    func submit(_ input: String) {
        guard let term = Int(input) else { return }
        let result = calculateSequence(term: term)
        self.pastCalculations.append(PreviousCalculation(input: input, timeElapsed: result.timeElapsed))
        self.calculatedSequence = result
        output?.didCalculateSequence()
    }

    func navigateToSumary() {
        let viewModel = SummaryViewModel(calculatedSequences: pastCalculations)
        let viewController = SummaryViewController(viewModel: viewModel)
        navController?.pushViewController(viewController, animated: true)
    }
}

