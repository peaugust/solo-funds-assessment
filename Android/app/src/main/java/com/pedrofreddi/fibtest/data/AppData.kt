package com.pedrofreddi.fibtest.data

sealed interface AppRoute {
    val route: String
    val title: String
    val hasRightAction: Boolean
}

data object Calculation: AppRoute {
    override val route = "calculation"
    override val title = "FibTest"
    override val hasRightAction = true
}

data object Summary: AppRoute {
    override val route = "summary"
    override val title = "Summary"
    override val hasRightAction = false
}

val appRoutes = listOf(Calculation, Summary)