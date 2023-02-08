//
//  MovieManager.swift
//  MovieApp
//
//  Created by Полина Толстенкова on 17.10.2022.
//

import Foundation
import Combine

class MovieManager {
    
    func fetchMovies(_ url: URL) -> AnyPublisher<Movie, Error> {
       return URLSession.shared
            .dataTaskPublisher(for: url)
            .receive(on: DispatchQueue.main)
            .map(\.data)
            .decode(type: Movie.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
