//
//  NetworkProvider.swift
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
    case emptyResponseDataError
}

class NetworkProvider {

    private init() { }
    
    static let shared: NetworkProvider = NetworkProvider()
    
    func request<T: Decodable>(_ endpoint: Endpoint) -> Promise<T> {
        return Promise { seal in
            guard let url = endpoint.url else {
                return seal.reject(NetworkError.badUrl)
            }
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                Logger.log(for: url.absoluteString, with: response)
                
                guard let data = data else {
                    return seal.reject(NetworkError.emptyResponseDataError)
                }
                
                do {
                    let decodableObject = try JSONDecoder().decode(T.self, from: data)
                    return seal.fulfill(decodableObject)
                } catch {
                    return seal.reject(NetworkError.mappingError)
                }
            }.resume()
        }
    }
    
}
