//
//  Endpoint.swift
//  Antares
//
//  Created by Leandro Romano on 08/05/19.
//  Copyright © 2019 Leandro Romano. All rights reserved.
//

import Foundation

enum MovieCategory: String {
    case latest
    case popular
    case upcoming
    case nowPlaying = "now_playing"
    case topRated = "top_rated"
}

struct Endpoint {
    let prefix: String = Constants.apiMovieEndpointUrl
    var path: String
    let queryItems: [URLQueryItem]
}

extension Endpoint {
    var url: URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = Constants.apiHostUrl
        components.path = "\(prefix)\(path)"
        components.queryItems = queryItems
        
        return components.url
    }
}

extension Endpoint {
    static func search(by category: MovieCategory, page: Int = 1) -> Endpoint {
        return Endpoint(
            path: "/\(category.rawValue)",
            queryItems: [
                URLQueryItem(name: "api_key", value: Configuration.getValue(for: .movieDatabaseAPIKey)),
                URLQueryItem(name: "page", value: "\(page)")
            ]
        )
    }
}

extension Endpoint {
    static func getDetailsForMovie(id movieId: Int) -> Endpoint {
        return Endpoint(
            path: "/\(movieId)",
            queryItems: [
                URLQueryItem(name: "api_key", value: Configuration.getValue(for: .movieDatabaseAPIKey))
            ]
        )
    }
}
