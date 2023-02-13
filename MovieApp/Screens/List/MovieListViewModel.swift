//
//  MovieViewModel.swift
//  MovieApp
//
//  Created by Полина Толстенкова on 15.10.2022.
//

import Foundation

class MovieListViewModel: ObservableObject {
    
    @Published var movies: [Results] = []
    @Published var error: Error?
    @Published var alertIsPresented: Bool = false
    
    let dataManager = MovieManager()
    
    init() {
        getMovies()
    }
    
    func getMovies() {
        dataManager.fetchMovies { [weak self] movies, error in
            if let movies = movies {
                self?.movies = movies.results
            } else {
                self?.alertIsPresented = true
                self?.error = error
            }
        }
    }
    
    func getMoviesWithGenre(genre: Int) -> [Results] {
        var moviesWithGenre: [Results] = []
        
        for movie in movies {
            for movieGenre in movie.genres {
                if movieGenre == genre {
                    moviesWithGenre.append(movie)
                } else if genre == 0 {
                    return movies
                }
            }
        }
        return moviesWithGenre
    }
}
