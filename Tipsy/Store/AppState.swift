//
//  AppState.swift
//  Tipsy
//
//  Created by Kourtnie Jenkins on 4/13/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import ReSwift

struct AppState: StateType {
    var billTotal: Float = 0.0
    var tipPercentage: Float = 0.15
    var splitDivisor: Int = 1
    var splitBillTotal: Float = 0
}

let store = Store<AppState>(
    reducer: splitBillReducer,
    state: AppState()
)
