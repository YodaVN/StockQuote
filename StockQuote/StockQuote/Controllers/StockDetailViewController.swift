//
//  StockDetailViewController.swift
//  StockQuote
//
//  Created by Nhan Nguyen on 10/16/19.
//  Copyright © 2019 Nhan Nguyen. All rights reserved.
//

import UIKit

class StockDetailViewController: UIViewController {
    @IBOutlet weak var symbol: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var dayHigh: UILabel!
    @IBOutlet weak var dayLow: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        symbol.accessibilityIdentifier = "label--articleSymbol"
        name.accessibilityIdentifier = "label--articleName"
        dayHigh.accessibilityIdentifier = "label--articleDayHigh"
        dayHigh.accessibilityIdentifier = "button--articleDayHigh"
    }
    
    func updateUI(symbol: String, name: String, dayHigh: String, dayLow: String, dayChange: String) {
        self.symbol.text = symbol
        self.name.text = name
        self.dayLow.text = "Day Low: $\(dayLow)"
        self.dayHigh.text = "Day High: $\(dayHigh)"
        self.title = dayChange
    }
}
