//
//  ContentView.swift
//  MovieApp
//
//  Created by Полина Толстенкова on 15.10.2022.
//

import SwiftUI

struct TickerListView: View {
    
    @ObservedObject var viewModel = TickerListViewModel()

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.tickers, id: \.self) { ticker in
                        
                    NavigationLink {
                        TickerDetailsView(viewModel: TickerDetailsViewModel(ticker: ticker.ticker))
                    } label: {
                        VStack {
                            ListText(text: ticker.name, size: 16)
                            ListText(text: "Type: \(ticker.type)", size: 15, color: .gray)
                            ListText(text: "Location: \(ticker.locale)", size: 15, color: .gray)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 20))
                    .frame(height: 40)
                }
            }
            .navigationTitle("list_tickers".localized)
            .alert(isPresented: $viewModel.alertIsPresented) {
                Alert(title: Text(viewModel.error?.localizedDescription ?? "unexpected_error".localized),
                      dismissButton: .default(Text("OK")))
            }
        }
    }
}

struct ListText: View {
    
    @State var text: String
    @State var size: CGFloat
    @State var color: Color?
    
    var body: some View {
        Text(text)
        .font(.system(size: size))
        .foregroundColor(color)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TickerListView()
    }
}
#endif
