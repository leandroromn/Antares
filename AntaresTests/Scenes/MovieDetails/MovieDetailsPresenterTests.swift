//
//  MovieDetailsPresenterTests.swift
//  AntaresTests
//
//  Created by Leandro Romano on 27/08/19.
//  Copyright © 2019 Leandro Romano. All rights reserved.
//

import XCTest
import Cuckoo
import Nimble

@testable import Antares

class MovieDetailsPresenterTests: XCTestCase {

    var sut: MovieDetailsPresenter!
    
    override func setUp() {
        super.setUp()
        sut = MovieDetailsPresenter()
    }
    
    func testPresentLoading() {
        let mockViewController = MockMovieDetailsDisplayLogic()
        
        stub(mockViewController) { stub in
            when(stub.displayLoading()).thenDoNothing()
        }
        
        sut.viewController = mockViewController
        sut.presentLoading()
        
        verify(mockViewController, times(1)).displayLoading()
    }
    
    func testHideLoading() {
        let mockViewController = MockMovieDetailsDisplayLogic()
        
        stub(mockViewController) { stub in
            when(stub.hideLoading()).thenDoNothing()
        }
        
        sut.viewController = mockViewController
        sut.hideLoading()
        
        verify(mockViewController, times(1)).hideLoading()
    }
    
    func testPresentDetails() {
        let mockViewController = MockMovieDetailsDisplayLogic()
        
        stub(mockViewController) { stub in
            when(stub.displayDetails(any())).thenDoNothing()
        }
        
        sut.viewController = mockViewController
        sut.presentDetails(MovieDetails.Response(title: "a-valid-title", posterPath: "a-valid-poster-path", overview: "an-overview-movie", duration: 1, releaseDate: "01/01/1970", status: "release"))
        
        verify(mockViewController, times(1)).displayDetails(any())
    }
    
    func testPresentError() {
        let mockViewController = MockMovieDetailsDisplayLogic()
        
        stub(mockViewController) { stub in
            when(stub.displayError(any())).thenDoNothing()
        }
        
        sut.viewController = mockViewController
        sut.presentError(NetworkError.mappingError)
        
        verify(mockViewController, times(1)).displayError(any())
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }

}
