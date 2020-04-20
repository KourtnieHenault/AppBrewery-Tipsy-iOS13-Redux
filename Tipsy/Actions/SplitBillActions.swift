//
//  splitBillActions.swift
//  Tipsy
//
//  Created by Kourtnie Jenkins on 4/13/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//
import Foundation
import ReSwift

//struct UpdateBillTotal: Action {
//    let billTotal: Float
//
//    init(to billTotal: Float) {
//        self.billTotal = billTotal
//    }
//}
//
//struct IncrementSplitDivisor: Action {
//    let splitDivisor: Int
//
//    init(by splitDivisor: Int) {
//        self.splitDivisor = splitDivisor
//    }
//}
//
//struct DecrementSplitDivisor: Action {
//    let splitDivisor: Int
//
//    init(by splitDivisor: Int) {
//        self.splitDivisor = splitDivisor
//    }
//}
//
//struct UpdateSplitPercentage: Action {
//    let splitPercentage: Float
//
//    init(to splitPercentage: Float) {
//        self.splitPercentage = splitPercentage
//    }
//}
//
//struct CalculateSplitBillTotal: Action { }


enum SplitBillActions: Action {
    case UpdateBillTotal(total: Float)
    case UpdateTipPercentage(percentage: Float)
    case IncrementSplitDivisor(Int)
    case DecrementSplitDivisor(Int)
    case CalculateSplitBillTotal
}
