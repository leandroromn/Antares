//
//  Logger.swift
//  Antares
//
//  Created by Leandro Romano on 03/06/19.
//  Copyright © 2019 Leandro Romano. All rights reserved.
//

import Foundation

struct Logger {
    
    static func log(for url: String, with response: URLResponse?) {
        #if DEBUG
        if let response = response as? HTTPURLResponse {
            print("✅ url", url)
            print("✅ status code", response.statusCode)
        }
        #endif
    }
    
}
