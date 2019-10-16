//
//  StockClient.swift
//  StockQuote
//
//  Created by Nhan Nguyen on 10/15/19.
//  Copyright © 2019 Nhan Nguyen. All rights reserved.
//

import Foundation

class StockClient {
    let baseURL: URL
    let session: URLSession
    
    init(baseURL: URL, session: URLSession) {
        self.baseURL = baseURL
        self.session = session
    }
}
