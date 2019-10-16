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
        
        self.title = "Oct 15, 2019"
    }
}
