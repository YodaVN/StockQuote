//
//  StockDetailViewController.swift
//  StockQuoteTests
//
//  Created by Nhan Nguyen on 10/16/19.
//  Copyright © 2019 Nhan Nguyen. All rights reserved.
//

import XCTest
@testable import StockQuote

class StockDetailViewControllerTests: XCTestCase {
    
    var sut: StockDetailViewController!

    override func setUp() {
        super.setUp()
        sut = StockDetailViewController(nibName: "StockDetailView", bundle: nil)
        sut.loadViewIfNeeded()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testInit_notNil() {
        //then
        XCTAssertNotNil(sut)
    }
    
    func test_shouldShowSymbolLabel() {
        //then
        XCTAssertEqual("AAPL", sut.symbol.text)
    }
    
    func test_shouldShowNameLabel() {
        //then
        XCTAssertEqual("Apple Inc", sut.name.text)
    }
    
    func test_shouldShowDayHighLabel() {
        //then
        XCTAssertEqual("123.00", sut.dayHigh.text)
    }
    
    func test_shouldShowDayLowLabel() {
        //then
        XCTAssertEqual("123.00", sut.dayLow.text)
    }
}
