//
//  StockQuoteUITests.swift
//  StockQuoteUITests
//
//  Created by Nhan Nguyen on 10/16/19.
//  Copyright © 2019 Nhan Nguyen. All rights reserved.
//

import XCTest
@testable import StockQuote

class StockQuoteUITests: XCTestCase {
    
    var sut: XCUIApplication!

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        sut = XCUIApplication()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testTableInteraction() {
        sut.launch()
     
        // Assert that we are displaying the tableview
        let articleTableView = sut.tables["table--articleTableView"]
     
        XCTAssertTrue(articleTableView.exists, "The article tableview exists")
    }

    func testLaunchPerformance() {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
