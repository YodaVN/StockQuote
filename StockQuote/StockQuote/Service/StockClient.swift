//
//  StockClient.swift
//  StockQuote
//
//  Created by Nhan Nguyen on 10/15/19.
//  Copyright © 2019 Nhan Nguyen. All rights reserved.
//

import Foundation

class StockClient {
    var baseURL: URL
    var session: URLSession
    
    static let shared = StockClient(baseURL: URL(string: "https://api.worldtradingdata.com/api/v1/")!, session: .shared)
    
    init(baseURL: URL, session: URLSession) {
        self.baseURL = baseURL
        self.session = session
    }
    
    func fetchStocks(completion:@escaping (Stock?, Error?) -> Void) -> URLSessionDataTask{
        let urlString = "https://api.worldtradingdata.com/api/v1/stock?symbol=NKE,APPL,BA,MSFT&api_token=d57PoxaqI6RfRw9FBwBZIibckA8b6sIRQ2mePCy23vDrxQnTqtNDywoeQlMS"
        let url = URL(string: urlString)!
        
        let task = session.dataTask(with: url) { (data, resp, err) in
            if let err = err {
                print("Failed to fetch albums:", err)
                completion(nil, nil)
                
                return
            }
            
            guard let data = data else { return }
            
            do {
                let stockResult = try JSONDecoder().decode(Stock.self, from: data)
                completion(stockResult, nil)
            } catch let error as NSError {
                print("Failed to decode json:", error)
                completion(nil, error)
            }
            
        }
        task.resume()
        
        return task
    }
}
