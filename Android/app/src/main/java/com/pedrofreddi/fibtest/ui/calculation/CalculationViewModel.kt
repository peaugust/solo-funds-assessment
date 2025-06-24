package com.pedrofreddi.fibtest.ui.calculation

import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableLongStateOf
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.setValue
import androidx.lifecycle.ViewModel
import kotlin.time.measureTime

class CalculationViewModel: ViewModel() {
    var input by mutableStateOf("")
        private set
    var results by mutableStateOf(listOf<Long>())
        private set
    var timeElapsed by mutableLongStateOf(0L)
        private set
    var pastCalculations by mutableStateOf(emptyList<Pair<Int, Long>>())

    fun onInputChange(newInput: String) {
        input = newInput
    }

    fun onDone() {
        val term = input.toIntOrNull()
        if(term != null) {
            val calculated = calculateFibonacci(term)
            timeElapsed = calculated.first
            results = calculated.second
            pastCalculations = pastCalculations + listOf(term to calculated.first)
        }
    }

    private fun calculateFibonacci(term: Int): Pair<Long, List<Long>> {
        var fibSequence = mutableListOf<Long>()
        var firstPreviousTerm: Long = 0L
        var secondPreviousTerm: Long = 1L
        var timeMeasure = measureTime {
            for(currentTerm in 0..term) {
                when(currentTerm) {
                    0 -> fibSequence.add(firstPreviousTerm)
                    1 -> fibSequence.add(secondPreviousTerm)
                    else -> {
                        val nextValue = firstPreviousTerm + secondPreviousTerm
                        firstPreviousTerm = secondPreviousTerm
                        secondPreviousTerm = nextValue
                        fibSequence.add(nextValue)
                    }
                }
            }
        }.inWholeMicroseconds
        return timeMeasure to fibSequence
    }
}