//
//  DetailView.swift
//  MovieApp
//
//  Created by Полина Толстенкова on 16.10.2022.
//

import SwiftUI

struct DetailView: View {
    @State var title: LocalizedStringKey
    @State var text: String
    
    var body: some View {
        HStack {
            Text(title)
                .frame(alignment: .top)
                .bold()
            Text("\(text)")
                .frame(alignment: .top)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .font(.system(size: 20))
        .padding(.top, 5)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(title: "Rating", text: "20")
    }
}
