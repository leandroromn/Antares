//
//  BaseResponse.swift
//  Antares
//
//  Created by Leandro Romano on 20/05/19.
//  Copyright © 2019 Leandro Romano. All rights reserved.
//

class BaseResponse<T: Decodable>: Decodable {
    
    let page: Int
    let totalResults: Int
    let totalPages: Int
    let results: T
    
    enum CodingKeys: String, CodingKey {
        case page
        case results
        case totalResults = "total_results"
        case totalPages = "total_pages"
    }
    
}
