//
//  ListMoviesModels.swift
//  Antares
//
//  Created by Leandro Romano on 05/05/19.
//  Copyright (c) 2019 Leandro Romano. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum ListMovies {
    
    class Response: BaseResponse<[Movie]> {
        
        init(page: Int, totalPages: Int, totalResults: Int, results: [Movie]) {
            super.init(page: page, totalResults: totalResults, totalPages: totalPages, results: results)
        }
        
        required init(from decoder: Decoder) throws {
            try super.init(from: decoder)
        }
        
    }
    
    struct ViewModel {
        let page: Int
        let movies: [MovieViewModel]
    }

}
