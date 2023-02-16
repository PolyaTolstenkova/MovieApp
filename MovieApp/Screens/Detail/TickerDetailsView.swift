//
//  MovieDescriptionView.swift
//  MovieApp
//
//  Created by Полина Толстенкова on 15.10.2022.
//

import SwiftUI

struct TickerDetailsView: View {
    
    @State var isPresented: Bool = false
    @ObservedObject var viewModel: TickerDetailsViewModel
    
    var body: some View {
        VStack {
            if let ticker = viewModel.ticker {
                
                ImageView(brand: ticker.results.branding, viewModel: viewModel)
                
                Text(ticker.results.name)
                    .font(.system(size: 30))
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.vertical)
                
                Text("Employees: \(ticker.results.employees)")
                    .font(.system(size: 20))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Button {
                    isPresented = true
                } label: {
                    Text("details_button".localized)
                        .foregroundColor(.white)
                        .font(.system(size: 25))
                        .padding()
                        .frame(alignment: .center)
                }
                .frame(width: 300.0, height: 60.0)
                .background(.purple)
                .padding()
                .sheet(isPresented: $isPresented) {
                    WebView(url: ticker.results.url)
                }
                .alert(isPresented: $viewModel.alertIsPresented) {
                    Alert(title: Text(viewModel.error?.localizedDescription ?? "unexpected_error".localized),
                          dismissButton: .default(Text("OK")))
                }
            }
        }
        .padding(.horizontal, 20)
    }
}

#if DEBUG
struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TickerDetailsView(viewModel: TickerDetailsViewModel(ticker: ""))
    }
}
#endif
