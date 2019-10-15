//
//  Stock.swift
//  StockQuote
//
//  Created by Nhan Nguyen on 10/15/19.
//  Copyright © 2019 Nhan Nguyen. All rights reserved.
//

import Foundation

struct Stock: Codable {
    let symbolsRequested, symbolsReturned: Int
    let data: [Datum]

    enum CodingKeys: String, CodingKey {
        case symbolsRequested = "symbols_requested"
        case symbolsReturned = "symbols_returned"
        case data
    }

    init(symbolsRequested: Int, symbolsReturned: Int, data: [Datum]) {
        self.symbolsRequested = symbolsRequested
        self.symbolsReturned = symbolsReturned
        self.data = data
    }
}

// MARK: - Datum
struct Datum: Codable, Equatable {
    
    let symbol, name: String
    let currency: String?
    let price: String
    let priceOpen: String?
    let dayHigh, dayLow: String
    let the52_WeekHigh, the52_WeekLow: String?
    let dayChange: String
    let changePct, closeYesterday, marketCap, volume: String?
    let volumeAvg, shares, stockExchangeLong, stockExchangeShort: String?
    let timezone, timezoneName, gmtOffset: String?
    let lastTradeTime: String
    let pe, eps: String?

    enum CodingKeys: String, CodingKey {
        case symbol, name, currency, price
        case priceOpen = "price_open"
        case dayHigh = "day_high"
        case dayLow = "day_low"
        case the52_WeekHigh = "52_week_high"
        case the52_WeekLow = "52_week_low"
        case dayChange = "day_change"
        case changePct = "change_pct"
        case closeYesterday = "close_yesterday"
        case marketCap = "market_cap"
        case volume
        case volumeAvg = "volume_avg"
        case shares
        case stockExchangeLong = "stock_exchange_long"
        case stockExchangeShort = "stock_exchange_short"
        case timezone
        case timezoneName = "timezone_name"
        case gmtOffset = "gmt_offset"
        case lastTradeTime = "last_trade_time"
        case pe, eps
    }

    init(symbol: String, name: String, currency: String?, price: String, priceOpen: String?, dayHigh: String, dayLow: String, the52_WeekHigh: String?, the52_WeekLow: String?, dayChange: String, changePct: String?, closeYesterday: String?, marketCap: String?, volume: String?, volumeAvg: String?, shares: String?, stockExchangeLong: String?, stockExchangeShort: String?, timezone: String?, timezoneName: String?, gmtOffset: String?, lastTradeTime: String, pe: String?, eps: String?) {
        self.symbol = symbol
        self.name = name
        self.currency = currency
        self.price = price
        self.priceOpen = priceOpen
        self.dayHigh = dayHigh
        self.dayLow = dayLow
        self.the52_WeekHigh = the52_WeekHigh
        self.the52_WeekLow = the52_WeekLow
        self.dayChange = dayChange
        self.changePct = changePct
        self.closeYesterday = closeYesterday
        self.marketCap = marketCap
        self.volume = volume
        self.volumeAvg = volumeAvg
        self.shares = shares
        self.stockExchangeLong = stockExchangeLong
        self.stockExchangeShort = stockExchangeShort
        self.timezone = timezone
        self.timezoneName = timezoneName
        self.gmtOffset = gmtOffset
        self.lastTradeTime = lastTradeTime
        self.pe = pe
        self.eps = eps
    }
}

