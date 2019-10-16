//
//  StockListViewControllerTests.swift
//  StockQuoteTests
//
//  Created by Nhan Nguyen on 10/15/19.
//  Copyright © 2019 Nhan Nguyen. All rights reserved.
//

import XCTest
@testable import StockQuote

class StockListViewControllerTests: XCTestCase {
    
    var sut: StockListViewController!
    
    override func setUp() {
        super.setUp()
        sut = StockListViewController(nibName: "StockListView", bundle: nil)
        sut.loadViewIfNeeded()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    // MARK: - Given
    func givenStockViewModels(count: Int = 3) {
        guard count > 0 else {
            sut.viewModels = []
            return
        }
        sut.viewModels = givenDatum(count: count).map { StockViewModel(datum: $0) }
    }
    
    func givenDatum(count: Int = 3) -> [Datum] {
        return (0 ..< count).map { i in
            let datum = Datum(symbol: "NKE", name: "NIKE", currency: "USD", price: "35.6", priceOpen: "12", dayHigh: "50", dayLow: "20", the52_WeekHigh: "70", the52_WeekLow: "10", dayChange: "-0.5", changePct: "3%", closeYesterday: "40", marketCap: "123", volume: "5", volumeAvg: "5", shares: "5", stockExchangeLong: "5", stockExchangeShort: "6", timezone: "EST", timezoneName: "+7", gmtOffset: "+6", lastTradeTime: "2019-10-15 13:16:51", pe: "pe", eps: "eps")
            return datum
        }
    }
    
    // MARK: - Tests UITableView
    func test_viewModels_setToEmpty() {
        XCTAssertEqual(sut.viewModels.count, 0)
    }
    
    func test_controller_hasTableView() {
        //then
        XCTAssertNotNil(sut.tableView, "StockListViewController should have a tableview")
    }
    
    func test_tableView_numberOfRows_returns0() {
        // given
        let expected = 0
        
        // when
        let actual = sut.tableView(sut.tableView, numberOfRowsInSection: 0)
        
        // then
        XCTAssertEqual(actual, expected)
    }
    
    func test_tableView_numberOfRows_returnsViewModelsCount() {
        // given
        let expected = 3
        givenStockViewModels(count: expected)
        
        // when
        let actual = sut.tableView(sut.tableView, numberOfRowsInSection: 0)
        
        // then
        XCTAssertEqual(actual, expected)
    }
    
    func test_tableView_cellForRowAt_returnsStockDetailCells() {
        // given
        givenStockViewModels()
        
        // when
        var arrayCell = [UITableViewCell]()
        for _ in 0 ..< sut.viewModels.count {
            let cell = sut.tableView.dequeueReusableCell(withIdentifier: "StockCell") as! StockDetailCell
            arrayCell.append(cell)
        }
        
        // then
        for cell in arrayCell {
            XCTAssertTrue(cell is StockDetailCell)
        }
    }
}
