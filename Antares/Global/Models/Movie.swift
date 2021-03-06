//
//  Movie.swift
//  Antares
//
//  Created by Leandro Romano on 20/05/19.
//  Copyright © 2019 Leandro Romano. All rights reserved.
//

import UIKit

enum MovieCoverSize: String {
    case original
    case small = "w500"
}

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
    
    init(voteCount: Int, id: Int, video: Bool, voteAverage: Double, title: String, popularity: Double, posterPath: String, originalLanguage: String, originalTitle: String, genres: [Int], backdropPath: String?, adult: Bool, overview: String, releaseDate: String) {
        self.voteCount = voteCount
        self.id = id
        self.video = video
        self.voteAverage = voteAverage
        self.title = title
        self.popularity = popularity
        self.posterPath = posterPath
        self.originalLanguage = originalLanguage
        self.originalTitle = originalTitle
        self.genres = genres
        self.backdropPath = backdropPath
        self.adult = adult
        self.overview = overview
        self.releaseDate = releaseDate
    }
    
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

struct MovieViewModel {
    let id: Int
    let title: String
    let voteAverage: Double
    let genres: [String]
    let poster: String?
    
    init(movie: Movie) {
        self.id = movie.id
        self.title = movie.title
        self.voteAverage = movie.voteAverage
        self.genres = []
        self.poster = AntaresUtils.getCoverImageBy(path: movie.posterPath, withSize: .original)
    }
}
