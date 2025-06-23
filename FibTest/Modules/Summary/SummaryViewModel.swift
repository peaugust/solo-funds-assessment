//
//  SummaryViewModel.swift
//  FibTest
//
//  Created by Pedro Freddi on 23/06/25.
//

import Foundation

class SummaryViewModel {

    var calculatedSequences: [PreviousCalculation]

    init(calculatedSequences: [PreviousCalculation]) {
        self.calculatedSequences = calculatedSequences
    }
}
