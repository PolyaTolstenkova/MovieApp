//
//  MockTickerManager.swift
//  MovieAppTests
//
//  Created by Полина Толстенкова on 17.02.2023.
//

import XCTest
@testable import MovieApp

class MockTickerManager: TickerManagerProtocol {
    
    var tickers: Tickers?
    var tickerDetails: TickerDetails?
    var error: Error?
    
    func fetchTickers(completion: @escaping (Tickers?, Error?) -> Void) {
        completion(tickers, error)
    }
    
    func fetchTickerDetails(ticker: String, completion: @escaping (TickerDetails?, Error?) -> Void) {
        completion(tickerDetails, error)
    }
}
