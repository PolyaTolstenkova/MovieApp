//
//  ImageViewModel.swift
//  MovieApp
//
//  Created by Полина Толстенкова on 16.10.2022.
//

import Foundation
import SwiftUI
import Combine

class ImageViewModel: ObservableObject {
    
    @Published var image: UIImage = UIImage()
    
    private var subscriptions = Set<AnyCancellable>()
    
    func fetchImage(_ imageURLString: String) {
        if let url = URL(string:  "https://image.tmdb.org/t/p/w500\(imageURLString)") {
            URLSession.shared
                .dataTaskPublisher(for: url)
                .receive(on: DispatchQueue.main)
                .map(\.data)
                .sink { result in
                    
                } receiveValue: { [weak self] imageData in
                    self?.image = UIImage(data: imageData) ?? UIImage()
                }
                .store(in: &subscriptions)
        }
    }
}
