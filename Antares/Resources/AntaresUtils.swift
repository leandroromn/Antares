//
//  AntaresUtils.swift
//  Antares
//
//  Created by Leandro Romano on 09/06/19.
//  Copyright © 2019 Leandro Romano. All rights reserved.
//

import Foundation

struct AntaresUtils {
    
    static func getCoverImageBy(path: String, withSize size: MovieCoverSize) -> String {
        return "\(Constants.apiImageHostUrl)/\(size.rawValue)\(path)"
    }
    
}
