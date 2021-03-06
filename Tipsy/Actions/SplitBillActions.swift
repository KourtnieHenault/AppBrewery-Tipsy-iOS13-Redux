//
//  splitBillActions.swift
//  Tipsy
//
//  Created by Kourtnie Jenkins on 4/13/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//
import Foundation
import ReSwift

enum SplitBillActions: Action {
    case UpdateBillTotal(total: Float)
    case UpdateTipPercentage(percentage: Float)
    case IncrementSplitDivisor
    case DecrementSplitDivisor
    case CalculateSplitBillTotal
}
