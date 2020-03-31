//
//  SplitBillCalculator.swift
//  Tipsy
//
//  Created by Kourtnie Jenkins on 3/26/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct SplitBillCalculator {
    var billTotal: Float?
    var tipPercentage: Float?
    var splitDivisor: Int?

    func splitBill() -> Float {
        return (((billTotal ?? Float(0)) + calculateTipAmount()) / Float(splitDivisor ?? 0))
    }

    private func calculateTipAmount() -> Float{
        return (billTotal ?? Float(0)) * (tipPercentage ?? Float(0))
    }

    public func getSplitDivisor() -> Int{
        return splitDivisor ?? 0
    }

    public func getTipPercentage() -> Float{
        return tipPercentage ?? Float(0)
    }
    
}
