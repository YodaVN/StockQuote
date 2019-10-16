//
//  StockClientTests.swift
//  StockQuoteTests
//
//  Created by Nhan Nguyen on 10/15/19.
//  Copyright © 2019 Nhan Nguyen. All rights reserved.
//

import XCTest
@testable import StockQuote

class StockClientTests: XCTestCase {
    var sut: StockClient!
    var baseURL: URL!
    var session: URLSession!
    
    override func setUp() {
        super.setUp()
        baseURL = URL(string: "https://api.worldtradingdata.com/api/v1/")!
        session = URLSession.shared
        sut = StockClient(baseURL: baseURL, session: session)
    }
    override func tearDown() {
        baseURL = nil
        session = nil
        sut = nil
        super.tearDown()
    }
    
    func testInit_baseURL() {
        //then
        XCTAssertEqual(sut.baseURL, baseURL)
    }
    
    func testInit_session() {
        //then
        XCTAssertEqual(sut.session, session)
    }
}
