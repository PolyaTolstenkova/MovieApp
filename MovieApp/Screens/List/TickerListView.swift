//
//  ContentView.swift
//  MovieApp
//
//  Created by Полина Толстенкова on 15.10.2022.
//

import SwiftUI

struct TickerListView: View {
    
    @ObservedObject var viewModel = TickerListViewModel(tickerManager: TickerManager())

    var body: some View {
        NavigationView {
            if viewModel.isLoading {
                ProgressView()
            } else {
                List {
                    ForEach(viewModel.tickers, id: \.self) { ticker in
                        
                        NavigationLink {
                            TickerDetailsView(
                                viewModel: TickerDetailsViewModel(
                                    ticker: ticker.ticker,
                                    tickerManager: TickerManager()
                                )
                            )
                        } label: {
                            VStack {
                                listText(text: ticker.name, size: 16)
                                listText(
                                    text: "\("list_type".localized) \(ticker.type)",
                                    size: 15,
                                    color: .gray
                                )
                                listText(
                                    text: "\("list_location".localized) \(ticker.location)",
                                    size: 15,
                                    color: .gray
                                )
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
                          dismissButton: .default(Text("alert_button_ok".localized)))
                }
            }
        }
    }
}

extension TickerListView {
    func listText(text: String, size: CGFloat, color: Color? = .black) -> some View {
        
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
