//
//  SplitBillReducer.swift
//  Tipsy
//
//  Created by Kourtnie Jenkins on 4/13/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation
import ReSwift

func splitBillReducer(action: Action, state: AppState?) -> AppState {
    
    var state = state ?? AppState()
    
    guard let action = action as? SplitBillActions else {
        return state
    }
    
    switch action {
    case .IncrementSplitDivisor:
        state.splitDivisor += 1
        
    case .DecrementSplitDivisor:
        if(state.splitDivisor > 1) {
            state.splitDivisor -= 1
        }
    case .UpdateBillTotal(let total):
        state.billTotal = total
        
    case .UpdateTipPercentage(let percentage):
        state.tipPercentage = percentage
        
    case .CalculateSplitBillTotal:
        let billTotal = state.billTotal
        let tip = billTotal * state.tipPercentage
        let divisor = Float(state.splitDivisor)
        let splitBillTotal = (billTotal + tip) / divisor
        
        state.splitBillTotal = splitBillTotal
    
    }
    
    return state
    
}
