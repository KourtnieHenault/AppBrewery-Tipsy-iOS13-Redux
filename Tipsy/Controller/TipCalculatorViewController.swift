//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class TipCalculatorViewController: UIViewController {
    
    var splitBillCalculator = SplitBillCalculator()

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var tenPercentButton: UIButton!
    @IBOutlet weak var fifteenPercentButton: UIButton!
    @IBOutlet weak var twentyPercentButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        splitBillCalculator.splitDivisor = 1
        splitBillCalculator.tipPercentage = 0.15
    }

    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        resetTipButtonSelection()
        sender.isSelected = true
        
        let tipPercentage = getTipSelectionFromButton(button: sender)
        splitBillCalculator.tipPercentage = tipPercentage
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        billTextField.endEditing(true)
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        splitBillCalculator.splitDivisor = Int(sender.value)
    }
    
    
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        print(billTextField.text)
        splitBillCalculator.billTotal = Float(billTextField.text ?? String(0))
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
            destinationVC.splitBillCalculator = splitBillCalculator
        }
    }

}

