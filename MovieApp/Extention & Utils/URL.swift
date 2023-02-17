//
//  URL.swift
//  MovieApp
//
//  Created by Полина Толстенкова on 17.02.2023.
//

import Foundation

extension URL {
    
    func addApiKey(apiKey: String) -> URL? {
        let urlWithApiKey = URL(string: "\(self)?apiKey=\(apiKey)#")
        return urlWithApiKey
    }
}
