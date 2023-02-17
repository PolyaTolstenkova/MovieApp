//
//  MovieManager.swift
//  MovieApp
//
//  Created by Полина Толстенкова on 13.02.2023.
//

import Foundation

class TickerManager: TickerManagerProtocol {
    
    private let tickerDataManager = DataManager<TickerDTO>()
    private let detailsDataManager = DataManager<TickerDetailsDTO>()
    
    private let url = "tickers_url".localized
    
    func fetchTickers(completion: @escaping (Tickers?, Error?) -> Void) {
        tickerDataManager.fetchData(
            url: url
        ) { tickers, error in
            
            if let tickers = tickers {
                completion(tickers.toDomainModel(), nil)
            } else {
                completion(nil, error)
            }
        }
    }
    
    func fetchTickerDetails(ticker: String, completion: @escaping (TickerDetails?, Error?) -> Void) {
        
        let url = "\("ticker_details_url".localized)\(ticker)"
        detailsDataManager.fetchData(url: url) { tickers, error in
            if let tickers = tickers {
                completion(tickers.toDomainModel(), nil)
            } else {
                completion(nil, error)
            }
        }
    }
}
