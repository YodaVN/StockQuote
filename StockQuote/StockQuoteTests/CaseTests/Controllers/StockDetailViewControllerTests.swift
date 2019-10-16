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
        sut =  StockDetailViewController(nibName: "StockDetailView", bundle: nil)
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_shouldShowCountryName() {
        //then
        XCTAssertNotNil(sut)
    }
}
