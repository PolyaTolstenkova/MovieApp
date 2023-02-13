//
//  ImageView.swift
//  MovieApp
//
//  Created by Полина Толстенкова on 16.10.2022.
//

import SwiftUI

struct ImageView: View {
    @State var movieImage: String
    
    var body: some View {
        AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(movieImage)")) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
        } placeholder: {
            ProgressView()
        }
    }
}
