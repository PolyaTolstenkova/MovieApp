//
//  MovieViewModel.swift
//  MovieApp
//
//  Created by Полина Толстенкова on 15.10.2022.
//

import Foundation

class TickerListViewModel: ObservableObject {
    
    @Published var tickers: [Results] = []
    @Published var error: Error?
    @Published var alertIsPresented: Bool = false
    
    let dataManager = TickerManager()
    
    init() {
        getTickers()
    }
    
    func getTickers() {
        dataManager.fetchTickers { [weak self] tickers, error in
            if let tickers = tickers {
                self?.tickers = tickers.results
            } else {
                self?.alertIsPresented = true
                self?.error = error
            }
        }
    }
}
