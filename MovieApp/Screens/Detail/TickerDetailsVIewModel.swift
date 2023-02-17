//
//  TickerDetailsVIewModel.swift
//  MovieApp
//
//  Created by Полина Толстенкова on 13.02.2023.
//

import Foundation
import SwiftUI

class TickerDetailsViewModel: ObservableObject, TickerDetailsViewModelProtocol {
    
    @Published var ticker: TickerDetails?
    @Published var error: Error?
    @Published var alertIsPresented: Bool = false
    
    private let tickerManager: TickerManagerProtocol
    
    private var tickerName: String = ""
    
    init(ticker: String, tickerManager: TickerManagerProtocol) {
        self.tickerName = ticker
        self.tickerManager = tickerManager
    }

    func getTickerDetails() {
        tickerManager.fetchTickerDetails(ticker: tickerName) { [weak self] ticker, error in
            if let ticker = ticker {
                self?.ticker = ticker
            } else {
                self?.alertIsPresented = true
                self?.error = error
            }
        }
    }
}
