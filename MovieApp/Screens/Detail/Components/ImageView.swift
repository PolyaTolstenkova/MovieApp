//
//  ImageView.swift
//  MovieApp
//
//  Created by Полина Толстенкова on 13.02.2023.
//

import SwiftUI

struct ImageView: View {
    
    @State var brand: Branding?
    @ObservedObject var viewModel: TickerDetailsViewModel
    
    var body: some View {
        
        if let brand = brand {
            if let icon = brand.icon {
                VStack {
                    AsyncImage(url: viewModel.getImageURL(url: icon)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(.trailing, 20)
                            .frame(alignment: .leading)
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 100)
                }
                .frame(alignment: .leading)
            }
        }
    }
}
