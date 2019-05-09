//
//  DataLoader.swift
//  Antares
//
//  Created by Leandro Romano on 08/05/19.
//  Copyright © 2019 Leandro Romano. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case badUrl
}

class DataLoader {
    func request(_ endpoint: Endpoint, then handler: @escaping (Result<Int, NetworkError>) -> Void) {
        guard let url = endpoint.url else {
            return handler(.failure(.badUrl))
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            handler(.success(5))
        }
        
        task.resume()
    }
}
