//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

extension String {
    func toDouble() -> Double? {
        return NumberFormatter().number(from: self)?.doubleValue
    }
}

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    
    var selectedTip: Double = 0.00
    var selectedSplitNumber: Double = 0.0
    var outputValue = "0.00"
    var tip = "0.00"
    var spilitNumber = "0.0"
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        billTextField.endEditing(true)
        
        let tipButtons = [zeroPctButton, tenPctButton, twentyPctButton]
        
        for button in tipButtons {
            button?.isSelected = false
        }
        sender.isSelected = true
        
        switch sender {
        case zeroPctButton:
            selectedTip = 0.00
        case tenPctButton:
            selectedTip = 0.10
        case twentyPctButton:
            selectedTip = 0.20
        default:
            break
        }
        print(selectedTip)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        
        billTextField.endEditing(true)
        selectedSplitNumber = sender.value
        splitNumberLabel.text = String(format: "%.0f", selectedSplitNumber)
        print(selectedSplitNumber)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        // Convert from String to Double.
        // !Use the value from the billTextField instead of a hardcoded value of "0.00"
        // !Check the billTextField text to make sure it contains a valid number before converting it to Double.
        if let billTextToDouble = billTextField.text?.toDouble(), billTextToDouble > 0.00 {
            let output = (billTextToDouble * selectedTip) + billTextToDouble / selectedSplitNumber
            print(output)
            outputValue = String(format: "%.2f", output)
        } else {
            print("billTextField does not contain Double")
        }
        // trigger of a segue
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.calculationResult = outputValue
            destinationVC.tip = selectedTip
            destinationVC.splitNumber = splitNumberLabel.text
        }
    }
}

