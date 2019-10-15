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
    
    func test_controller_hasTableView() {
        //then
        XCTAssertNotNil(sut.tableView, "StockListViewController should have a tableview")
    }
}
