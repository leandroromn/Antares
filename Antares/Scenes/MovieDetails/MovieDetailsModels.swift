//
//  MovieDetailsModels.swift
//  Antares
//
//  Created by Leandro Romano on 24/08/19.
//  Copyright (c) 2019 Leandro Romano. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum MovieDetails {
  
    struct Response: Decodable {
        let title: String
        let posterPath: String
        let overview: String
        let duration: Int
        let releaseDate: String
        let revenue: Double
        let status: String
        
        enum CodingKeys: String, CodingKey {
            case title
            case posterPath = "poster_path"
            case overview
            case duration = "runtime"
            case releaseDate = "release_date"
            case revenue
            case status
        }
    }
    
    struct ViewModel {
        let title: String
        let posterPath: String
        let overview: String
        let duration: Int
        let releaseDate: String
        let revenue: Double
        let status: String
        
        init(response: MovieDetails.Response) {
            self.title = response.title
            self.posterPath = response.posterPath
            self.overview = response.overview
            self.duration = response.duration
            self.releaseDate = response.releaseDate
            self.revenue = response.revenue
            self.status = response.status
        }
    }

}
