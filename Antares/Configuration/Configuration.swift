//
//  Configuration.swift
//  Antares
//
//  Created by Leandro Romano on 25/05/19.
//  Copyright © 2019 Leandro Romano. All rights reserved.
//

import Foundation

enum ConfigurationType: String {
    case movieDatabaseAPIKey = "THE_MOVIE_DB_API_KEY"
}

struct Configuration {
    static func getValue<T>(for configuration: ConfigurationType) -> T {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("Info.plist not found.")
        }
        
        guard let configValue = dict[configuration.rawValue] as? T else {
            fatalError("Unable to find the configuration value of '\(configuration.rawValue)'.")
        }
        
        return configValue
    }
}
