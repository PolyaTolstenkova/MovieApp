//
//  MovieManager.swift
//  MovieApp
//
//  Created by Полина Толстенкова on 13.02.2023.
//

import Foundation

class MovieManager {
    let manager = DataManager<Movie>()
    
    func fetchMovies(completion: @escaping (Movie?, Error?) -> Void) {
        manager.fetchData(
            url: "https://api.themoviedb.org/3/movie/top_rated?api_key=162ddaab84697ae414c4a5a14a4d64fa"
        ) { movies, error in
            if let movies = movies {
                completion(movies, nil)
            } else {
                completion(nil, error)
            }
        }
    }
}
