//
//  MovieDescriptionView.swift
//  MovieApp
//
//  Created by Полина Толстенкова on 15.10.2022.
//

import SwiftUI
import Combine

struct MovieDescriptionView: View {
    
    @State var movieDetailVM = MovieDetailViewModel()
    
    @State var movieImage: String
    @State var movieTitle: String
    @State var movieDescription: String
    @State var movieRating: Float
    @State var movieGenres: [Genres]
    
    var body: some View {
        VStack {
            ImageView(movieImage: $movieImage)
            Text(movieTitle)
                .font(.system(size: 30))
                .bold()
            Text(movieDescription)
                .font(.system(size: 20))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 5)
            DetailView(title: "Rating", text: movieDetailVM.stringFormatting(movieRating))
            DetailView(title: "Genre", text: movieDetailVM.getAllGenres(movieGenres))
            Spacer()
        }
        .padding()
    }
}

struct MovieDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDescriptionView(movieImage: "image", movieTitle: "MOVIE", movieDescription: "description...", movieRating: 13.2, movieGenres: [Genres(name: "Drama")])
    }
}


