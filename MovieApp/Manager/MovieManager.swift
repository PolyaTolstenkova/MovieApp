//
//  MovieManager.swift
//  MovieApp
//
//  Created by Полина Толстенкова on 17.10.2022.
//

import Foundation
import Combine

class MovieManager {
    
    func fetchMovies(_ url: URL) -> AnyPublisher<MovieData, Error> {
           return URLSession.shared
                .dataTaskPublisher(for: url)
                .receive(on: DispatchQueue.main)
                .map(\.data)
                .decode(type: MovieData.self, decoder: JSONDecoder())
                .eraseToAnyPublisher()
    }
}

