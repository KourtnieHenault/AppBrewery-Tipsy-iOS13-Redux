//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import ReSwift

class TipCalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var tenPercentButton: UIButton!
    @IBOutlet weak var fifteenPercentButton: UIButton!
    @IBOutlet weak var twentyPercentButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        resetTipButtonSelection()
        sender.isSelected = true
        
        let tipPercentage = getTipSelectionFromButton(button: sender)
        store.dispatch(SplitBillActions.UpdateTipPercentage(percentage: tipPercentage))
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        billTextField.endEditing(true)
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        
        let currentDivisor = store.state.splitDivisor
        let newDivisor = Int(sender.value)
        
        if (newDivisor > currentDivisor){
            store.dispatch(SplitBillActions.IncrementSplitDivisor(1))
        }else {
            store.dispatch(SplitBillActions.DecrementSplitDivisor(1))
        }
        
    }
    
    
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        
        if let billTotal = Float(billTextField.text ?? String(0)) {
            store.dispatch(SplitBillActions.UpdateBillTotal(total: billTotal))
        }
        
        store.dispatch(SplitBillActions.CalculateSplitBillTotal)
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    func resetTipButtonSelection(){
        tenPercentButton.isSelected = false
        fifteenPercentButton.isSelected = false
        twentyPercentButton.isSelected = false
    }
    
    func getTipSelectionFromButton(button: UIButton) -> Float{
        
        var percentage: Float = 0.0
        
        if let buttonTitle = button.currentTitle {
            percentage = convertButtonTitleToFloat(buttonTitle: buttonTitle) / Float(100)
            
        }
        
        return percentage

    }
    
    func convertButtonTitleToFloat(buttonTitle: String) -> Float {
            
        return Float((buttonTitle.split(separator: "%"))[0]) ?? 0.0
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            
            let destinationVC = segue.destination as! TipResultViewController
           
        }
    }

}
