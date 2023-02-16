//
//  MovieModel.swift
//  MovieApp
//
//  Created by Полина Толстенкова on 15.10.2022.
//

import Foundation

struct Ticker: Decodable {
    let results: [Results]
}

struct Results: Decodable, Hashable {

    let ticker: String
    let name: String
    let type: String
    let locale: String
}
