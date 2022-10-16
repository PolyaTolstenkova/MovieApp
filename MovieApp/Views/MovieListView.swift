//
//  ContentView.swift
//  MovieApp
//
//  Created by Полина Толстенкова on 15.10.2022.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var movieViewModel = MovieViewModel()

    var body: some View {
        NavigationView {
            List {
                ForEach(movieViewModel.movies) { movie in
                    NavigationLink(movie.title){
                        MovieDescriptionView(movieImage: movie.image, movieTitle: movie.title, movieDescription: movie.description, movieRating: movie.rating, movieGenres: movie.genres)
                    }
                    .font(.system(size: 25))
                    .frame(height: 50)
                }
            }
            .navigationTitle("Movies")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
