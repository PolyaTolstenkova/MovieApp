//
//  MovieManager.swift
//  MovieApp
//
//  Created by Полина Толстенкова on 13.02.2023.
//

import Foundation

class TickerManager {
    let manager = DataManager<Ticker>(token: "wMNVr1V6G1q8gfTtgfMQbTv4cktBOyCG")
    
    let url = "https://api.polygon.io/v3/reference/tickers?active=true"
    
    func fetchTickers(completion: @escaping (Ticker?, Error?) -> Void) {
        manager.fetchData(
            url: url
        ) { tickers, error in
            
            if let tickers = tickers {
                completion(tickers, nil)
            } else {
                completion(nil, error)
            }
        }
    }
}
