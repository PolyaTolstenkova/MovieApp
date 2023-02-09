//
//  GenrePickerView.swift
//  MovieApp
//
//  Created by Полина Толстенкова on 08.02.2023.
//

import SwiftUI

struct GenrePickerView: View {
    
    @ObservedObject var viewModel = GenrePickerViewModel()
    @State var selectedGenre: String = "fwerfwef"
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Pick a genre")
                .font(.system(size: 30))
                .bold()
                
                List {
                    ForEach(viewModel.genres, id: \.id) { genre in
                        NavigationLink(genre.name) {
                            MovieListView(selectedGenre: genre)
                        }
                    }
                }
                .listStyle(.sidebar)
            }
        }
    }
}

#if DEBUG
struct GenrePickerView_Previews: PreviewProvider {
    static var previews: some View {
        GenrePickerView()
    }
}
#endif
