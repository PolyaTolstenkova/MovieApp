//
//  TickerManagerProtocol.swift
//  MovieApp
//
//  Created by Полина Толстенкова on 17.02.2023.
//

import Foundation

protocol TickerManagerProtocol {
    
    func fetchTickers(completion: @escaping (Tickers?, Error?) -> Void)
    func fetchTickerDetails(ticker: String, completion: @escaping (TickerDetails?, Error?) -> Void)
}
