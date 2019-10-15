//
//  StockCellViewController.swift
//  StockQuote
//
//  Created by Nhan Nguyen on 10/15/19.
//  Copyright © 2019 Nhan Nguyen. All rights reserved.
//

import Foundation
import UIKit

class StockDetailCell: UITableViewCell {
    @IBOutlet weak var symbol: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var dayChange: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
