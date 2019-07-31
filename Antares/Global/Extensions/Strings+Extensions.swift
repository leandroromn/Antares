//
//  URL+Extensions.swift
//  Antares
//
//  Created by Leandro Romano on 30/07/19.
//  Copyright © 2019 Leandro Romano. All rights reserved.
//

import Foundation

extension String {
    
    func getCoverImageWith(size imageSize: MovieCoverSize) -> URL {
        return URL(string: AntaresUtils.getCoverImageBy(path: self, withSize: imageSize))!
    }
    
}
