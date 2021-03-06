//
//  MovieDetailsPresenter.swift
//  Antares
//
//  Created by Leandro Romano on 24/08/19.
//  Copyright (c) 2019 Leandro Romano. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol MovieDetailsPresentationLogic {
    func presentLoading()
    func hideLoading()
    func presentDetails(_ response: MovieDetails.Response)
    func presentError(_ error: Error)
}

class MovieDetailsPresenter: MovieDetailsPresentationLogic {

    weak var viewController: MovieDetailsDisplayLogic?
    
    func presentLoading() {
        viewController?.displayLoading()
    }
    
    func hideLoading() {
        viewController?.hideLoading()
    }
    
    func presentDetails(_ response: MovieDetails.Response) {
        let viewModel = MovieDetails.ViewModel(response: response)
        viewController?.displayDetails(viewModel)
    }
    
    func presentError(_ error: Error) {
        viewController?.displayError(error.localizedDescription)
    }
    
}
