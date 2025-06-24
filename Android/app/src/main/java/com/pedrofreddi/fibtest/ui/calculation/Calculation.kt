package com.pedrofreddi.fibtest.ui.calculation

import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.itemsIndexed
import androidx.compose.foundation.text.KeyboardActions
import androidx.compose.foundation.text.KeyboardOptions
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.OutlinedTextField
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Text
import androidx.compose.material3.TextButton
import androidx.compose.material3.TopAppBar
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.platform.LocalSoftwareKeyboardController
import androidx.compose.ui.text.input.ImeAction
import androidx.compose.ui.text.input.KeyboardType
import androidx.compose.ui.unit.dp
import androidx.navigation.NavHostController
import com.pedrofreddi.fibtest.R
import com.pedrofreddi.fibtest.data.Summary
import com.pedrofreddi.fibtest.ui.summary.Summary

@ExperimentalMaterial3Api
@Composable
fun Calculation(navController: NavHostController, viewModel: CalculationViewModel) {
    val context = LocalContext.current
    val keyboardController = LocalSoftwareKeyboardController.current

    Scaffold (
        topBar = {
            TopAppBar(title = {
                Text(context.getString(R.string.app_name))
            },
                actions = {
                    TextButton(
                        onClick = {
                            navController.navigate(Summary.route)
                        }
                    ) {
                        Text("Summary")
                    }
                })
        },
        bottomBar = {
            Text(context.getString(R.string.time_elapsed, viewModel.timeElapsed),
                modifier = Modifier.padding(bottom = 42.dp))
        }
    ) { innerPadding ->
        Column (modifier = Modifier.padding(innerPadding)) {
            OutlinedTextField(
                label = {
                    Text("Enter a number")
                },
                value = viewModel.input,
                onValueChange = {
                    viewModel.onInputChange(it)
                },
                keyboardOptions = KeyboardOptions.Default.copy(
                    keyboardType = KeyboardType.Number,
                    imeAction = ImeAction.Done
                ),
                keyboardActions = KeyboardActions(
                    onDone = {
                        keyboardController?.hide()
                        viewModel.onDone()
                    }
                ),
                modifier = Modifier
                    .fillMaxWidth()
            )
            LazyColumn(
                modifier = Modifier.padding(vertical = 8.dp)
            ) {
                itemsIndexed(viewModel.results) { index, calculatedTerm ->
                    Row(
                        modifier = Modifier
                            .fillMaxWidth()
                            .padding(vertical = 8.dp, horizontal = 8.dp),
                        horizontalArrangement = Arrangement.SpaceBetween
                    ) {
                        Text("$index")
                        Text("$calculatedTerm")
                    }
                }
            }
        }
    }
}