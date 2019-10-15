//
//  StockViewModelTests.swift
//  StockQuoteTests
//
//  Created by Nhan Nguyen on 10/15/19.
//  Copyright © 2019 Nhan Nguyen. All rights reserved.
//

import XCTest
@testable import StockQuote

class StockViewModelTests: XCTestCase {
    
    var cell: StockDetailCell!
    var datum: Datum!
    var sut: StockViewModel!
    
    override func setUp() {
        super.setUp()
        setUpViewModel()
    }
    
    override func tearDown() {
        datum = nil
        sut = nil
        super.tearDown()
    }
    
    //MARK: given
    func givenStockDetailCell() {
        let viewController = StockListViewController(nibName: "StockListView", bundle: nil)
        viewController.loadViewIfNeeded()
        
        let tableView = viewController.tableView!
        cell = tableView.dequeueReusableCell(withIdentifier: "StockCell") as? StockDetailCell
    }
    
    //MARK: when
    func whenConfigureStockDetailCell() {
        givenStockDetailCell()
        //        sut.configure(cell)
    }
    
    func setUpViewModel(symbol: String = "NKE", name: String = "NIKE", currency: String = "USD", price: String = "35.6", priceOpen: String = "12", dayHigh: String = "50", dayLow: String = "20", the52_WeekHigh: String = "70", the52_WeekLow: String = "10", dayChange: String = "-0.5", changePct: String = "3%", closeYesterday: String = "40", marketCap: String = "123", volume: String = "5", volumeAvg: String = "5", shares: String = "5", stockExchangeLong: String = "5", stockExchangeShort: String = "6", timezone: String = "EST", timezoneName: String = "+7", gmtOffset: String = "+6", lastTradeTime: String = "2019-10-15 13:16:51", pe: String = "pe", eps: String = "eps") {
        
        datum = Datum(symbol: symbol, name: name, currency: currency, price: price, priceOpen: priceOpen, dayHigh: dayHigh, dayLow: dayLow, the52_WeekHigh: the52_WeekHigh, the52_WeekLow: the52_WeekLow, dayChange: dayChange, changePct: changePct, closeYesterday: closeYesterday, marketCap: marketCap, volume: volume, volumeAvg: volumeAvg, shares: shares, stockExchangeLong: stockExchangeLong, stockExchangeShort: stockExchangeShort, timezone: timezone, timezoneName: timezoneName, gmtOffset: gmtOffset, lastTradeTime: lastTradeTime, pe: pe, eps: eps)
        
        sut = StockViewModel(datum: datum)
    }
    
    //MARK: tests Init
    func test_initDatum_setsDatum() {
      XCTAssertEqual(sut.datum, datum)
    }
    
    func test_priceEqual() {
        //when
        setUpViewModel(price: "123.6")
        
        //then
        XCTAssertEqual(sut.price, "123.6 $")
    }
    
    func test_dayChangeEqual() {
        //when
        setUpViewModel(dayChange: "-5.4")
        
        //then
        XCTAssertEqual(sut.dayChange, -5.4)
    }
    
    func test_lastTradeTimeEqual() {
        //when
        setUpViewModel(lastTradeTime: "2019-10-15 13:16:51")
        
        //then
        XCTAssertEqual(sut.lastTradeTime, "Oct 15,2019 13:16:51")
    }
}
