//
//  ImageView.swift
//  MovieApp
//
//  Created by Полина Толстенкова on 13.02.2023.
//

import SwiftUI

struct ImageView: View {
    
    @ObservedObject var viewModel: TickerDetailsViewModel
    let icon: URL?
    
    var body: some View {
        
        if let icon = icon {
            VStack {
                AsyncImage(url: icon.addApiKey(apiKey: "api_key".localized)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(.trailing, 20)
                } placeholder: {
                    ProgressView()
                }
                .frame(maxWidth: .infinity, maxHeight: 100, alignment: .leading)
            }
        }
    }
}
