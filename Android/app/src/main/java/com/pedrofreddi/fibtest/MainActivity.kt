@file:OptIn(ExperimentalMaterial3Api::class)

package com.pedrofreddi.fibtest

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.navigation.compose.rememberNavController
import com.pedrofreddi.fibtest.ui.AppNavHost
import com.pedrofreddi.fibtest.ui.calculation.CalculationViewModel
import com.pedrofreddi.fibtest.ui.theme.FibTestTheme

@ExperimentalMaterial3Api
class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContent {
            FibTestTheme {
                var navController = rememberNavController()
                val viewModel = CalculationViewModel()

                AppNavHost(
                    navController,
                    viewModel
                )
            }
        }
    }
}

