//
//  DataLoader.swift
//  Antares
//
//  Created by Leandro Romano on 08/05/19.
//  Copyright © 2019 Leandro Romano. All rights reserved.
//

import Foundation
import PromiseKit

enum NetworkError: Error {
    case badUrl
    case mappingError
}

class DataLoader {
    func request(_ endpoint: Endpoint) -> Promise<Bool> {
        return Promise { seal in
            guard let url = endpoint.url else {
                return seal.reject(NetworkError.badUrl)
            }
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let response = response as? HTTPURLResponse {
                    print("✅ url", url.absoluteString)
                    print("✅ status code", response.statusCode)
                }
                
                return seal.fulfill(true)
            }.resume()
        }
    }
}
