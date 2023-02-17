//
//  MovieViewModel.swift
//  MovieApp
//
//  Created by Полина Толстенкова on 15.10.2022.
//

import Foundation

class TickerListViewModel: ObservableObject, TickerListViewModelProtocol {
    
    @Published var tickers: [Ticker] = []
    @Published var error: Error?
    @Published var alertIsPresented: Bool = false
    @Published var isLoading: Bool = true
    
    private let tickerManager: TickerManagerProtocol
    
    init(tickerManager: TickerManagerProtocol) {
        self.tickerManager = tickerManager
        getTickers()
    }
    
    func getTickers() {
        tickerManager.fetchTickers { [weak self] tickers, error in
            if let tickers = tickers {
                self?.tickers = tickers.tickers
                
                if !(self?.tickers.isEmpty ?? false) {
                    self?.isLoading = false
                }
            } else {
                self?.alertIsPresented = true
                self?.error = error
            }
        }
    }
}
