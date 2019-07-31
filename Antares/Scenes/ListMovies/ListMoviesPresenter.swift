//
//  ListMoviesPresenter.swift
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

protocol ListMoviesPresentationLogic {
    func presentDynamicData()
    func presentError(_ error: Error)
}

class ListMoviesPresenter: ListMoviesPresentationLogic {

    weak var viewController: ListMoviesDisplayLogic?
    
    func presentDynamicData() {
        viewController?.displayDynamicData()
    }
    
    func presentError(_ error: Error) {
        viewController?.displayError(error)
    }
    
}
