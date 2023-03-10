//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var calculatorBrain = CalculatorBrain()
    var tip: Float = 0.0
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        if sender == zeroPctButton {
            zeroPctButton.isSelected = true
            tip = 0.0
        } else if sender == tenPctButton {
            tenPctButton.isSelected = true
            tip = 0.1
        } else {
            twentyPctButton.isSelected = true
            tip = 0.2
        }
    }

    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        billTextField.endEditing(true)
        splitNumberLabel.text = String(format: "%.0f", sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let bill = billTextField.text ?? ""
        let billFloat = Float(bill) ?? 0.0

        let splitNum = splitNumberLabel.text ?? "2"
        let splitNumFloat = Float(splitNum) ?? 0.0
        
        calculatorBrain.calculateSplitTotal(total: billFloat, tip: tip, splitNumber: splitNumFloat)
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as? ResultsViewController
            destinationVC?.splitTotal = calculatorBrain.getSplitTotal()
            destinationVC?.splitNum = calculatorBrain.getSplitNumber()
            destinationVC?.billTotal = calculatorBrain.getBillTotal()
            destinationVC?.tip = calculatorBrain.getTip()
        }
    }
    
    
}

