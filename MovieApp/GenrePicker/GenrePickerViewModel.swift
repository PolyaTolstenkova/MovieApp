//
//  GenrePickerViewModel.swift
//  MovieApp
//
//  Created by Полина Толстенкова on 08.02.2023.
//

import Foundation

class GenrePickerViewModel: ObservableObject {
    
    let genres: [Genre] = [
        Genre(id: 0, name: "movie_genre_all".localized),
        Genre(id: 28, name: "movie_genre_action".localized),
        Genre(id: 12, name: "movie_genre_adventure".localized),
        Genre(id: 16, name: "movie_genre_animation".localized),
        Genre(id: 35, name: "movie_genre_comedy".localized),
        Genre(id: 80, name: "movie_genre_crime".localized),
        Genre(id: 99, name: "movie_genre_documentary".localized),
        Genre(id: 18, name: "movie_genre_drama".localized),
        Genre(id: 10751, name: "movie_genre_family".localized),
        Genre(id: 14, name: "movie_genre_fantasy".localized),
        Genre(id: 36, name: "movie_genre_history".localized),
        Genre(id: 27, name: "movie_genre_horror".localized),
        Genre(id: 10402, name: "movie_genre_music".localized),
        Genre(id: 9648, name: "movie_genre_mystery".localized),
        Genre(id: 10749, name: "movie_genre_romance".localized),
        Genre(id: 878, name: "movie_genre_science_fiction".localized),
        Genre(id: 10770, name: "movie_genre_tv_movie".localized),
        Genre(id: 53, name: "movie_genre_thriller".localized),
        Genre(id: 10752, name: "movie_genre_war".localized),
        Genre(id: 37, name: "movie_genre_western".localized)
    ]
}
