//
//  MovieViewModel.swift
//  MovieApp
//
//  Created by Полина Толстенкова on 15.10.2022.
//

import Foundation
import Combine

class MovieViewModel: ObservableObject {
    
    @Published var movies: [Movie] = []
    private var subscriptions = Set<AnyCancellable>()
    
    func fetchMovies() {
        for i in 1...200 {
            if let url = URL(string:  "https://api.themoviedb.org/3/movie/\(i)?api_key=162ddaab84697ae414c4a5a14a4d64fa") {
                URLSession.shared
                    .dataTaskPublisher(for: url)
                    .receive(on: DispatchQueue.main)
                    .map(\.data)
                    .decode(type: MovieData.self, decoder: JSONDecoder())
                    .sink { res in
                        
                    } receiveValue: { [weak self] movieData in
                        let movie = Movie(id: movieData.id, image: movieData.backdrop_path, title: movieData.original_title, description: movieData.overview, rating: movieData.popularity, genres: movieData.genres)
                        self?.movies.append(movie)
                    }
                    .store(in: &subscriptions)
                    
            }
        }
    }
    
    init() {
        fetchMovies()
    }
}
