//
//  ContentView.swift
//  MovieApp
//
//  Created by Полина Толстенкова on 15.10.2022.
//

import SwiftUI

struct MovieListView: View {
    
    @ObservedObject var viewModel = MovieListViewModel()
    @State var selectedGenre: Genre

    var body: some View {
        VStack {
            if !viewModel.getMoviesWithGenre(genre: selectedGenre.id).isEmpty {
                List {
                    ForEach(viewModel.getMoviesWithGenre(genre: selectedGenre.id)) { movie in
                        NavigationLink(movie.title) {
                            MovieDetailView(
                                movieImage: movie.image,
                                movieTitle: movie.title,
                                movieDescription: movie.description,
                                movieRating: movie.rating
                            )
                        }
                        .font(.system(size: 20))
                        .frame(height: 40)
                    }
                }
                .navigationTitle(selectedGenre.name)
            } else {
                Text("There is no such movies")
                    .frame(maxWidth: .infinity, alignment: .center)
                    .font(.system(size: 30))
                    .foregroundColor(.gray)
                    .bold()
                
                Image("List")
                    .padding(.horizontal, 30)
            }
        }
        .alert(isPresented: $viewModel.alertIsPresented) {
            Alert(title: Text(viewModel.error?.localizedDescription ?? "unexpected_error".localized),
                  dismissButton: .default(Text("OK")))
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView(selectedGenre: Genre(id: 0, name: ""))
    }
}
#endif
