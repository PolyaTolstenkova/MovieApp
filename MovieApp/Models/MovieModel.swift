//
//  MovieModel.swift
//  MovieApp
//
//  Created by Полина Толстенкова on 15.10.2022.
//

import Foundation

struct Movie: Decodable {
    let results: [Results]
}

struct Results: Decodable, Identifiable {
    
    let id: Int
    let image: String
    let title: String
    let description: String
    let rating: Float
    let genres: [Int]
    
    enum CodingKeys: String, CodingKey {
        case id
        case image = "backdrop_path"
        case title
        case description = "overview"
        case rating = "vote_average"
        case genres = "genre_ids"
    }
}
