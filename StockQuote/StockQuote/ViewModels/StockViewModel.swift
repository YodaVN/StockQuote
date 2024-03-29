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
        if price == "" {
            return "$0"
        }
        let convertPrice = "$\(price)"
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
        dateFormatterPrint.dateFormat = "MMM dd, yyyy"
        
        if let date = dateFormatterGet.date(from: lastTradeTime) {
            return (dateFormatterPrint.string(from: date))
        } else {
            return ""
        }
    }
    
    func config(_ cell: StockDetailCell) {
        cell.symbol.text = symbol
        cell.name.text = name
        cell.price.text = price
        
        var dayChangeString = String(dayChange)
        if dayChange >= 0 {
            cell.dayChange.backgroundColor = .green
            dayChangeString = "+\(dayChangeString)"
        } else {
            cell.dayChange.backgroundColor = .red
        }
        cell.dayChange.text = dayChangeString
    }
}

extension StockViewModel: Equatable {
  static func == (lhs: StockViewModel, rhs: StockViewModel) -> Bool {
    return lhs.datum == rhs.datum
  }
}
