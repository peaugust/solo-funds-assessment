//
//  FibTestTests.swift
//  FibTestTests
//
//  Created by Pedro Freddi on 22/06/25.
//

import XCTest
@testable import FibTest

class MockCalcVMOutput: CalculationViewModelOutput {
    var didCallCalculateSequence: Bool = false
    func didCalculateSequence() {
        didCallCalculateSequence = true
    }
}

final class FibTestTests: XCTestCase {

    var navController: UINavigationController!
    var sut: CalculationScreenViewModel!
    var mockOutput: MockCalcVMOutput!
    var fib0Sequence: [Decimal]!
    var fib1Sequence: [Decimal]!
    var fib10Sequence: [Decimal]!

    override func setUpWithError() throws {
        navController = UINavigationController()
        mockOutput = MockCalcVMOutput()
        sut = CalculationScreenViewModel(navController: navController)
        sut.output = mockOutput
        fib0Sequence = [0]
        fib1Sequence = [0, 1]
        fib10Sequence = [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55]
    }

    override func tearDownWithError() throws {
        navController = nil
        sut = nil
        fib10Sequence = nil
    }


    func testFib0() throws {
        XCTAssertEqual(fib0Sequence, sut.calculateSequence(term: 0).sequence)
    }

    func testFib1() throws {
        XCTAssertEqual(fib1Sequence, sut.calculateSequence(term: 1).sequence)
    }

    func testFib10() throws {
        XCTAssertEqual(fib10Sequence, sut.calculateSequence(term: 10).sequence)
    }

    func testSubmitFib10_notifiesOutput() throws {
        sut.submit("10")
        XCTAssertNotNil(sut.calculatedSequence)
        XCTAssertEqual(sut.calculatedSequence!.sequence, fib10Sequence)
        XCTAssertTrue(mockOutput.didCallCalculateSequence)
    }

    func testPastCalculationsAreStored() throws {
        sut.submit("10")
        sut.submit("0")
        sut.submit("1")
        let pastCalculations = sut.pastCalculations
        XCTAssertEqual(pastCalculations.count, 3)
        XCTAssertEqual(pastCalculations[0].input, "10")
        XCTAssertEqual(pastCalculations[1].input, "0")
        XCTAssertEqual(pastCalculations[2].input, "1")
    }
}
