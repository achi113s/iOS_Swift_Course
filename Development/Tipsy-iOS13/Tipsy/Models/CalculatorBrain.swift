//
//  CalculatorBrain.swift
//  Tipsy
//
//  Created by Giorgio Latour on 3/1/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

struct CalculatorBrain {
    var transaction: Transaction?
    
    mutating func calculateSplitTotal(total: Float, tip: Float, splitNumber: Float) {
        let splitTotal = (total * (1.0 + tip)) / splitNumber
        transaction = Transaction(splitNumber: String(format: "%.0f", splitNumber),
                                  billTotal: String(format: "%.2f", total),
                                  tip: String(format: "%.1f", tip),
                                  splitTotal: String(format: "%.2f", splitTotal))
    }
    
    func getSplitNumber() -> String {
        return transaction?.splitNumber ?? "0.0"
    }
    
    func getBillTotal() -> String {
        return transaction?.billTotal ?? "0.0"
    }
    
    func getTip() -> String {
        return transaction?.tip ?? "0.0"
    }
    
    func getSplitTotal() -> String {
        return transaction?.splitTotal ?? "0.0"
    }
}
