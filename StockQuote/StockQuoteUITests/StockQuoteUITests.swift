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
    var articleTableView: XCUIElement!

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        sut = XCUIApplication()
        
        articleTableView = sut.tables["table--articleTableView"]
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_tableInteraction() {
        //when
        sut.launch()
     
        //then
        XCTAssertTrue(articleTableView.exists, "The article tableview exists")
    }
    
    func test_checkSuccessGoToDetail() {
        //given
        let tableCells = articleTableView.cells
        
        //when
        sut.launch()
        
        //then
        if tableCells.count > 0 {
            let count: Int = (tableCells.count - 1)
         
            let promise = expectation(description: "Wait for tableCells to load")
         
            for i in stride(from: 0, to: count , by: 1) {
                let tableCell = tableCells.element(boundBy: i)
                XCTAssertTrue(tableCell.exists, "The \(i) cell is in place on the table")
                tableCell.tap()
         
                if i == (count - 1) {
                    promise.fulfill()
                }

                sut.navigationBars.buttons.element(boundBy: 0).tap()
            }
            waitForExpectations(timeout: 10, handler: nil)
            XCTAssertTrue(true, "Finished UI testing tableCells")
         
        } else {
            XCTAssert(false, "Can't find any tableCells")
        }
    }
}
