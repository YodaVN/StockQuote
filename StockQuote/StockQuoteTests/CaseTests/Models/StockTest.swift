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
    
    var sut: Datum!
    
    override func setUp() {
        super.setUp()
        guard let path = Bundle(for: type(of: self)).path(forResource: "Datum", ofType: "json") else {
            fatalError("Can't find Stock.json file")
        }
        let data = try! Data(contentsOf: URL(fileURLWithPath: path))
        
        sut = try! JSONDecoder().decode(Datum.self, from: data)
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
        //then
        XCTAssertEqual(sut.symbol, "BA")
        XCTAssertEqual(sut.name, "The Boeing Company")
        XCTAssertEqual(sut.price, "371.94")
        XCTAssertEqual(sut.dayChange, "-1.24")
    }
}
