//
//  MovieDetailsInteractorTests.swift
//  AntaresTests
//
//  Created by Leandro Romano on 27/08/19.
//  Copyright © 2019 Leandro Romano. All rights reserved.
//

import XCTest
import Cuckoo
import Nimble
import PromiseKit

@testable import Antares

class MovieDetailsInteractorTests: XCTestCase {

    var sut: MovieDetailsInteractor!
    var worker: MockMovieDetailsWorker!
    
    override func setUp() {
        super.setUp()
        PromiseKit.conf.Q.map = nil
        PromiseKit.conf.Q.return = nil
        
        worker = MockMovieDetailsWorker()
        sut = MovieDetailsInteractor(worker: worker)
        sut.movieId = 1
    }
    
    func testRequestDetailsSuccess() {
        let mockPresenter = MockMovieDetailsPresenter()
        
        stub(mockPresenter) { stub in
            when(stub.presentLoading()).thenDoNothing()
            when(stub.presentDetails(any())).thenDoNothing()
            when(stub.hideLoading()).thenDoNothing()
        }
        
        stub(worker) { stub in
            when(stub.retrieveDetailsForMovie(id: any())).then { _ in
                let response = MovieDetails.Response(
                    title: "a-valid-title",
                    posterPath: "a-valid-poster-path",
                    overview: "an-overview-for-movie",
                    duration: 1,
                    releaseDate: "01/01/1970",
                    status: "released"
                )
                return .value(response)
            }
        }
        
        sut.presenter = mockPresenter
        sut.requestDetails()
        
        verify(mockPresenter, times(1)).presentLoading()
        verify(mockPresenter, times(1)).presentDetails(any())
        verify(mockPresenter, times(1)).hideLoading()
    }
    
    func testRequestDetailsFailure() {
        let mockPresenter = MockMovieDetailsPresenter()
        
        stub(mockPresenter) { stub in
            when(stub.presentLoading()).thenDoNothing()
            when(stub.presentError(any())).thenDoNothing()
        }
        
        stub(worker) { stub in
            when(stub.retrieveDetailsForMovie(id: any())).then { _ in
                return Promise<MovieDetails.Response> { seal in
                    seal.reject(NetworkError.mappingError)
                }
            }
        }
        
        sut.presenter = mockPresenter
        sut.requestDetails()
        
        verify(mockPresenter, times(1)).presentLoading()
        verify(mockPresenter, times(1)).presentError(any())
    }

    override func tearDown() {
        super.tearDown()
        worker = nil
        sut = nil
    }

}
