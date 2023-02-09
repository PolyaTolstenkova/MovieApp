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
    
    let dataManager = DataManager()
    
    init() {
        getMovies()
    }
    
    func getMovies() {
        dataManager.fetchData(
            url: "https://api.themoviedb.org/3/movie/top_rated?api_key=162ddaab84697ae414c4a5a14a4d64fa",
            dataType: Movie.self
        ) { movies, error in
            if let movies = movies {
                self.movies = movies.results
            } else {
                self.alertIsPresented = true
                self.error = error
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
