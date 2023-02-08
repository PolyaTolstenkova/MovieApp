//
//  MovieDetailViewModel.swift
//  MovieApp
//
//  Created by Полина Толстенкова on 16.10.2022.
//

import Foundation

class MovieDetailViewModel: ObservableObject {
    
    func stringFormatting(_ floatToFormat: Float) -> String {
        let formattedString = String(format: "%.1f", floatToFormat)
        return formattedString
    }
}
