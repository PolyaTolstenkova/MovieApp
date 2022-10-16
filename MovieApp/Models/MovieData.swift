//
//  MovieModel.swift
//  MovieApp
//
//  Created by Полина Толстенкова on 15.10.2022.
//

import Foundation

struct MovieData: Decodable, Identifiable {
    
    let id: Int
    let backdrop_path: String
    let original_title: String
    let overview: String
    let popularity: Float
    let genres: [Genres]
    
}

struct Genres: Decodable {
    let name: String
}
