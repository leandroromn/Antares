//
//  Movie.swift
//  Antares
//
//  Created by Leandro Romano on 20/05/19.
//  Copyright © 2019 Leandro Romano. All rights reserved.
//

class Movie: Decodable {
    
    let voteCount: Int
    let id: Int
    let video: Bool
    let voteAverage: Double
    let title: String
    let popularity: Double
    let posterPath: String
    let originalLanguage: String
    let originalTitle: String
    let genres: [Int]
    let backdropPath: String?
    let adult: Bool
    let overview: String
    let releaseDate: String
    
    enum CodingKeys: String, CodingKey {
        case voteCount = "vote_count"
        case id
        case video
        case voteAverage = "vote_average"
        case title
        case popularity
        case posterPath = "poster_path"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case genres = "genre_ids"
        case backdropPath = "backdrop_path"
        case adult
        case overview
        case releaseDate = "release_date"
    }
    
}
