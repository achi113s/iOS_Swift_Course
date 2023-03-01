//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Giorgio Latour on 3/1/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    var splitTotal: String?
    var splitNum: String?
    var billTotal: String?
    var tip: String?
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let safeSplitTotal = splitTotal {
            totalLabel.text = "$\(safeSplitTotal)"
        }
        
        var tipPercent: String
        
        switch tip ?? "0.0" {
            case "0.0":
                tipPercent = "0%"
            case "0.1":
                tipPercent = "10%"
            case "0.2":
                tipPercent = "20%"
            default:
                tipPercent = "0%"
        }
        
        settingsLabel.text = "Split between \(splitNum ?? "2") people, with \(tipPercent) tip."
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
