//
//  StockViewModel.swift
//  StockQuote
//
//  Created by Nhan Nguyen on 10/15/19.
//  Copyright © 2019 Nhan Nguyen. All rights reserved.
//

import Foundation

class StockViewModel {
    
    let datum: Datum
    
    let symbol: String
    let name: String
    let price: String
    let dayHigh: String
    let dayLow: String
    let dayChange: Double
    let lastTradeTime: String
    
    init(datum: Datum) {
        self.datum = datum
        self.symbol = datum.symbol
        self.name = datum.name
        self.price = StockViewModel.price(datum.price)
        self.dayHigh = datum.dayHigh
        self.dayLow = datum.dayLow
        self.dayChange = StockViewModel.dayChange(datum.dayChange)
        self.lastTradeTime = StockViewModel.lastTradeTime(datum.lastTradeTime)
    }
    
    private static func price(_ price: String) -> String {
        let convertPrice = "\(price) $"
        return convertPrice
    }
    
    private static func dayChange(_ dayChange: String) -> Double {
        let checkNumber = Double(dayChange) ?? 0
        
        return checkNumber
    }
    
    private static func lastTradeTime(_ lastTradeTime: String) -> String {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MMM dd,yyyy HH:mm:ss"
        
        if let date = dateFormatterGet.date(from: lastTradeTime) {
            return (dateFormatterPrint.string(from: date))
        } else {
            return ""
        }
    }
    
    func configure(_ cell: StockDetailCell) {
        
    }
}
