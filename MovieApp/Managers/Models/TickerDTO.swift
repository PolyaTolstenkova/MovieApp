//
//  MovieModel.swift
//  MovieApp
//
//  Created by Полина Толстенкова on 15.10.2022.
//

import Foundation

struct TickerDTO: Decodable {
    let results: [Results]
}

struct Results: Decodable, Hashable {

    let ticker: String
    let name: String
    let type: String
    let locale: String
}

extension TickerDTO: DomainModelConvertible {
    func toDomainModel() -> Tickers? {
        
        let tickerDomainModel: [Ticker] = results.compactMap({
            return $0.toDomainModel()
        })
        
        return Tickers(tickers: tickerDomainModel)
    }
}

extension Results: DomainModelConvertible {
    func toDomainModel() -> Ticker {
        
        return Ticker(
            ticker: ticker,
            name: name,
            type: type,
            location: locale
        )
    }
}
