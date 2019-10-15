//
//  StockTest.swift
//  StockQuoteTests
//
//  Created by Nhan Nguyen on 10/15/19.
//  Copyright © 2019 Nhan Nguyen. All rights reserved.
//

@testable import StockQuote
import XCTest

class StockTest: XCTestCase {
    
    var sut: Stock!
    
    override func setUp() {
        super.setUp()
        guard let path = Bundle(for: type(of: self)).path(forResource: "Stock", ofType: "json") else {
            fatalError("Can't find Stock.json file")
        }
        let data = try! Data(contentsOf: URL(fileURLWithPath: path))
        
        sut = try! JSONDecoder().decode(Stock.self, from: data)
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    // MARK:
    func test_conformsTo_Decodable() {
        XCTAssertTrue((sut as Any) is Decodable)
    }
    
    // MARK:
    func testStock_responseEqual() {
        //given
        let data = sut.data.first!
        
        //then
        XCTAssertEqual(sut.symbolsRequested, 4)
        XCTAssertEqual(sut.symbolsReturned, 3)
        XCTAssertEqual(sut.data.count, 3)
        
        XCTAssertEqual(data.symbol, "BA")
        XCTAssertEqual(data.name, "The Boeing Company")
        XCTAssertEqual(data.price, "371.94")
        XCTAssertEqual(data.dayChange, "-1.24")
    }
}
