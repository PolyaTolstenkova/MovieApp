//
//  TickerDetailsManager.swift
//  MovieApp
//
//  Created by Полина Толстенкова on 13.02.2023.
//

import Foundation

class TickerDetailsManager {
    let manager = DataManager<TickerDetails>(token: "wMNVr1V6G1q8gfTtgfMQbTv4cktBOyCG")
    
    func fetchTickerDetails(ticker: String, completion: @escaping (TickerDetails?, Error?) -> Void) {
        
        let url = "https://api.polygon.io/v3/reference/tickers/\(ticker)"
        manager.fetchData(url: url) { tickers, error in
            if let tickers = tickers {
                completion(tickers, nil)
            } else {
                completion(nil, error)
            }
        }
    }
}
