//
//  ViewController.swift
//  Tipsy
//
//  Created by Dmytro Tishchenko on 31.03.21.
//

import UIKit

class CalculatorViewController: UIViewController {


    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var stepperButton: UIStepper!
    
    var numberOfPeople = 2
    var billTotal = 0.0
    var tip = 0.10
    var totalBill = "0.0"
    
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        
        if tenPctButton.isSelected{
            tip = 0.10
        }else if twentyPctButton.isSelected{
            tip = 0.20
        }else{
            tip = 0.00
        }
                
    }
    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let bill = billTextField.text
        if bill != "" {
            billTotal = Double(bill ?? "No value")!
            let result = billTotal * (1 + tip) / Double(numberOfPeople)
            totalBill = String(format: "%.2f", result)
            print(totalBill)
            print(tip)
        }
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    
    @IBAction func stepperPressed(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        numberOfPeople = Int(sender.value)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.finalTotal = totalBill
            destinationVC.tip = Int(tip * 100)
            destinationVC.numberOfpeople = numberOfPeople
        }
    }
}


