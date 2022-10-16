//
//  MovieModel.swift
//  MovieApp
//
//  Created by Полина Толстенкова on 15.10.2022.
//

import Foundation

struct Movie: Identifiable {
    
    let id: Int
    let image: String
    let title: String
    let description: String
    let rating: Float
    let genres: [Genres]
    
}
