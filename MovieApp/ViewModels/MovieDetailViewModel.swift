//
//  MovieDetailViewModel.swift
//  MovieApp
//
//  Created by Полина Толстенкова on 16.10.2022.
//

import Foundation

class MovieDetailViewModel {
    
    func stringFormatting(_ floatToFormat: Float) -> String {
        let formattedString = String(format: "%.1f", floatToFormat)
        return formattedString
    }
    
    func getAllGenres(_ genres: [Genres]) -> String {
        var genresString: String = ""
        
        for genre in genres {
            genresString += "\(genre.name), "
        }
        return genresString
    }
}
