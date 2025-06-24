package com.pedrofreddi.fibtest.ui

import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.runtime.Composable
import androidx.navigation.NavHostController
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import com.pedrofreddi.fibtest.data.Calculation
import com.pedrofreddi.fibtest.data.Summary
import com.pedrofreddi.fibtest.ui.calculation.Calculation
import com.pedrofreddi.fibtest.ui.calculation.CalculationViewModel
import com.pedrofreddi.fibtest.ui.summary.Summary

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun AppNavHost(
    navController: NavHostController,
    viewModel: CalculationViewModel
) {
    NavHost(
        navController = navController,
        startDestination = Calculation.route,
    ) {
        composable(route = Calculation.route) {
            Calculation(navController, viewModel)
        }
        composable(route = Summary.route) {
            Summary(navController, viewModel)
        }
    }
}