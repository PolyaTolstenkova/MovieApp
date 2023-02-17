//
//  Ticker.swift
//  MovieApp
//
//  Created by Полина Толстенкова on 17.02.2023.
//

import Foundation

struct Tickers {
    let tickers: [Ticker]
}

struct Ticker: Hashable {
    
    let ticker: String
    let name: String
    let type: String
    let location: String
}
