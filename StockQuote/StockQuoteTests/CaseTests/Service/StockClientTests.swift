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
    var mockSession: MockURLSession!
    
    override func setUp() {
        super.setUp()
        baseURL = URL(string: "https://api.worldtradingdata.com/api/v1/")!
        mockSession = MockURLSession(data: nil, urlResponse: nil, error: nil)
        sut = StockClient(baseURL: baseURL, session: mockSession)
    }
    override func tearDown() {
        baseURL = nil
        mockSession = nil
        sut = nil
        super.tearDown()
    }
    
    func whenFetchStocks(data: Data? = nil, error: Error? = nil) -> (calledCompletion: Bool, stocks: Stock?, error: Error?) {
        var calledCompletion = false
        var receivedStocks: Stock?  = nil
        var receivedError: Error? = nil
        
        let mockURLSession  = MockURLSession(data: data, urlResponse: nil, error: nil)
        sut.session = mockURLSession
        
        let mockTask = sut.fetchStocks { (stocks, error) in
            calledCompletion = true
            receivedStocks = stocks
            receivedError = error as NSError?
        } as! MockURLSessionDataTask
        
        mockTask.completionHandler(data, nil, error)
        return (calledCompletion, receivedStocks, receivedError)
    }
    
    func testInit_baseURL() {
        //then
        XCTAssertEqual(sut.baseURL, baseURL)
    }
    
    func testInit_session() {
        //then
        XCTAssertEqual(sut.session, mockSession)
    }
    
    func testFetchStocks_withExpectedURLHostAndPath() {
        sut.session = mockSession
        var dataTask: URLSessionDataTask? = sut.fetchStocks(completion: { (stocks, error) in })
        NSLog("\(String(describing: dataTask))")
        dataTask = nil
        XCTAssertEqual(mockSession.cachedUrl?.host, "api.worldtradingdata.com")
        XCTAssertEqual(mockSession.cachedUrl?.path, "/api/v1/stock")
    }
    
    func testFetchStock_success() {
        //given
        guard let path = Bundle(for: type(of: self)).path(forResource: "Stock_ValidJSON", ofType: "json") else {
            fatalError("Can't find Stock_ValidJSON.json file")
        }
        let data = try! Data(contentsOf: URL(fileURLWithPath: path))
        
        let stocks = try! JSONDecoder().decode(Stock.self, from: data)
        
        //when
        let result = whenFetchStocks(data: data, error: nil)
        
        // then
        XCTAssertTrue(result.calledCompletion)
        XCTAssertEqual(result.stocks, stocks)
        XCTAssertNil(result.error)
    }
    
    func testFetchStock_fail() {
        //given
        guard let path = Bundle(for: type(of: self)).path(forResource: "Stock_InvalidJSON", ofType: "json") else {
            fatalError("Can't find Stock_InvalidJSON.json file")
        }
        let data = try! Data(contentsOf: URL(fileURLWithPath: path))
        
        //when
        let result = whenFetchStocks(data: data, error: nil)
        
        //then
        XCTAssertTrue(result.calledCompletion)
        XCTAssertNil(result.stocks)
    }
}

class MockURLSession: URLSession {
    private let mockTask: MockURLSessionDataTask
    var cachedUrl: URL?


    init(data: Data?, urlResponse: URLResponse?, error: Error?) {
        mockTask = MockURLSessionDataTask(data: data, urlResponse: urlResponse, error: error)
    }

    override func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        self.cachedUrl = url
        mockTask.completionHandler = completionHandler
        return mockTask
    }
}

class MockURLSessionDataTask: URLSessionDataTask {
    private let data: Data?
    private let urlResponse: URLResponse?

    private let _error: Error?
    override var error: Error? {
        return _error
    }

    var completionHandler: ((Data?, URLResponse?, Error?) -> Void)!

    init(data: Data?, urlResponse: URLResponse?, error: Error?) {
        self.data = data
        self.urlResponse = urlResponse
        self._error = error
    }

    override func resume() {
        DispatchQueue.main.async {
            self.completionHandler(self.data, self.urlResponse, self.error)
        }
    }
}
