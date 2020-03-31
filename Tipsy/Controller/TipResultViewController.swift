//
//  TipResultViewController.swift
//  Tipsy
//
//  Created by Kourtnie Jenkins on 3/26/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class TipResultViewController: UIViewController {

    var splitBillCalculator:SplitBillCalculator?
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = String(format: "%.2f", splitBillCalculator?.splitBill() ?? Float(0))
        
        var tipPercentage = splitBillCalculator?.getTipPercentage() ?? Float(0)
        tipPercentage *= Float(100)
        
        let splitDivisor = splitBillCalculator?.getSplitDivisor() ?? 0
        
        settingsLabel.text = "Split between \(splitDivisor) people, with \(String(format: "%.1f", tipPercentage))% tip."
        
    }
    
    @IBAction func recalculateButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
