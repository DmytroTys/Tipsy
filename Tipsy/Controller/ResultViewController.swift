//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Dmytro Tishchenko on 31.03.21.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var finalTotal : String?
    var tip : Int!
    var numberOfpeople : Int!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        totalLabel.text = finalTotal
        settingsLabel.text = "Split between \(numberOfpeople ?? 0) people, with \(tip ?? 0) tip."
        
    }
    

    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
