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
    var mockSession: MockURLSession!
    
    override func setUp() {
        super.setUp()
        baseURL = URL(string: "https://api.worldtradingdata.com/api/v1/")!
        mockSession = MockURLSession()
        sut = StockClient(baseURL: baseURL, session: mockSession)
    }
    override func tearDown() {
        baseURL = nil
        mockSession = nil
        sut = nil
        super.tearDown()
    }
    
    func testInit_baseURL() {
        //then
        XCTAssertEqual(sut.baseURL, baseURL)
    }
    
    func testInit_session() {
        //then
        XCTAssertEqual(sut.session, mockSession)
    }
    
    func test_getDogs_callsExpectedURL() {
        // given
        let fetchStocksURL = URL(string: "https://api.worldtradingdata.com/api/v1/", relativeTo: baseURL)!
        
        // when
        let mockTask = sut.fetchStocks() { _, _ in } as! MockURLSessionDataTask
        
         //then
        XCTAssertEqual(mockTask.url, fetchStocksURL)
    }
}

class MockURLSession: URLSession {
    override func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return MockURLSessionDataTask(completionHandler: completionHandler, url: url)
    }
}

class MockURLSessionDataTask: URLSessionDataTask {
    var completionHandler: (Data?, URLResponse?, Error?) -> Void
    var url: URL
    init(completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void, url: URL) {
        self.completionHandler = completionHandler
        self.url = url
        super.init()
    }
    
    override func resume() {
        
    }
}
