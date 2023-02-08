//
//  MovieViewModel.swift
//  MovieApp
//
//  Created by Полина Толстенкова on 15.10.2022.
//

import Foundation
import Combine

class MovieListViewModel: ObservableObject {
    
    @Published var movies: [Results] = []
    private var subscriptions = Set<AnyCancellable>()
    
    let movieManager = MovieManager()
    
    func getMovies() {
        if let url = URL(string: "https://api.themoviedb.org/3/movie/top_rated?api_key=162ddaab84697ae414c4a5a14a4d64fa"
        ) {
            movieManager.fetchMovies(url)
                .sink { res in
                    switch res {
                    case .finished:
                        break
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                } receiveValue: { [weak self] movieData in
                    self?.movies = movieData.results
                }
                .store(in: &subscriptions)
        }
    }
    
    init() {
        getMovies()
    }
}
