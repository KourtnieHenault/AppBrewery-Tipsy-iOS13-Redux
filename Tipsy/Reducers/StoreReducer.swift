//
//  StoreReducer.swift
//  Tipsy
//
//  Created by Kourtnie Jenkins on 4/13/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

import ReSwift

func storeReducer(action: Action, state: AppState?) -> AppState {
    
    var state = state ?? AppState()
    
    switch action {
    case _ as Action:
        state = splitBillReducer(action: action, state: state)
    default:
        break
    }
    
    
    
    return state
}
