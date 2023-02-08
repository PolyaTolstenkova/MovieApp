//
//  ContentView.swift
//  MovieApp
//
//  Created by Полина Толстенкова on 15.10.2022.
//

import SwiftUI

struct MovieListView: View {
    
    @ObservedObject var movieViewModel = MovieListViewModel()

    var body: some View {
        List {
            ForEach(movieViewModel.movies) { movie in
                NavigationLink(movie.title) {
                    MovieDescriptionView(
                        movieImage: movie.image,
                        movieTitle: movie.title,
                        movieDescription: movie.description,
                        movieRating: movie.rating
                    )
                }
                .font(.system(size: 25))
                .frame(height: 50)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
