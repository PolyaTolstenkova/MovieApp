//
//  GenrePickerView.swift
//  MovieApp
//
//  Created by Полина Толстенкова on 08.02.2023.
//

import SwiftUI

struct GenrePickerView: View {
    
    @ObservedObject var viewModel = GenrePickerViewModel()
    @State var pickedGenre: String = "fwerfwef"
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Pick a genre")
                .font(.system(size: 30))
                .bold()
                
                Picker("Please choose a genre", selection: $pickedGenre) {
                    ForEach(viewModel.genres, id: \.id) {
                        Text($0.name)
                    }
                }
                .pickerStyle(.wheel)
                .padding(.vertical, 10)
                
                NavigationLink("Select") {
                    MovieListView()
                }
                .font(.system(size: 25))
                .bold()
                .foregroundColor(.white)
                .frame(width: 200, height: 50, alignment: .center)
                .background(.green)
            }
        }
    }
}

struct GenrePickerView_Previews: PreviewProvider {
    static var previews: some View {
        GenrePickerView()
    }
}
