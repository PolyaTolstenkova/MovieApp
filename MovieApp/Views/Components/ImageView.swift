//
//  ImageView.swift
//  MovieApp
//
//  Created by Полина Толстенкова on 16.10.2022.
//

import SwiftUI
import Combine

struct ImageView: View {
    
    @ObservedObject var imageViewModel = ImageViewModel()
    @State var image: UIImage = UIImage()
    @Binding var movieImage: String
    
    var body: some View {
        Image(uiImage: image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(maxWidth: .infinity)
            .onReceive(imageViewModel.$image) { image in
                self.image = image
            }
            .onAppear {
                imageViewModel.fetchImage(movieImage)
            }
    }
}
