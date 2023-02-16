//
//  TickerDetailsVIewModel.swift
//  MovieApp
//
//  Created by Полина Толстенкова on 13.02.2023.
//

import Foundation
import SwiftUI
import Alamofire

class TickerDetailsViewModel: ObservableObject {
    
    @Published var ticker: TickerDetails?
    @Published var error: Error?
    @Published var alertIsPresented: Bool = false
    
    let dataManager = TickerDetailsManager()
    
    private var tickerName: String = ""
    
    init(ticker: String) {
        self.tickerName = ticker
    }

    func getTickerDetails() {
        dataManager.fetchTickerDetails(ticker: tickerName) { [weak self] ticker, error in
            if let ticker = ticker {
                self?.ticker = ticker
            } else {
                self?.alertIsPresented = true
                self?.error = error
            }
        }
    }
    
    func getImageURL(url: URL?) -> URL? {
        if let url = url {
            let apiKey = "wMNVr1V6G1q8gfTtgfMQbTv4cktBOyCG#"
            let urlWithApiKey = URL(string: "\(url)?apiKey=\(apiKey)")
            return urlWithApiKey
        }
        return nil
    }
}
