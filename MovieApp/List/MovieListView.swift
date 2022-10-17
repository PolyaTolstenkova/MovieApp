//
//  ContentView.swift
//  MovieApp
//
//  Created by Полина Толстенкова on 15.10.2022.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var movieViewModel = MovieListViewModel()

    var body: some View {
        NavigationView {
            List {
                
                ForEach(movieViewModel.movies) { movie in
                    NavigationLink(movie.title){
                        MovieDescriptionView(movieImage: movie.image, movieTitle: movie.title, movieDescription: movie.description, movieRating: movie.rating)
                    }
                    .font(.system(size: 25))
                    .frame(height: 50)
                }
            }
            .navigationTitle("movie_list_navigation_title")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
