//
//  TipResultViewController.swift
//  Tipsy
//
//  Created by Kourtnie Jenkins on 3/26/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit
import ReSwift

class TipResultViewController: UIViewController {

    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        store.subscribe(self)
        
    }
    
    @IBAction func recalculateButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

//MARK: - Extends ReSwift StoreSubscriber
extension TipResultViewController: StoreSubscriber {
    
    typealias StoreSubscriberStateType = AppState
    
    func newState(state: AppState) {
        
        let splitBillTotal = store.state.splitBillTotal
        totalLabel.text = String(format: "%.2f", splitBillTotal)
        
        var tipPercentage = store.state.tipPercentage
        tipPercentage *= Float(100)
        
        let splitDivisor = store.state.splitDivisor
        
        settingsLabel.text = "Split between \(splitDivisor) people, with \(String(format: "%.1f", tipPercentage))% tip."
        
    }
    
}
