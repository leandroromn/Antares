//
//  ListMoviesInteractorTests.swift
//  AntaresTests
//
//  Created by Leandro Romano on 01/06/19.
//  Copyright © 2019 Leandro Romano. All rights reserved.
//

import XCTest
import Cuckoo
import Nimble
import PromiseKit

@testable import Antares

class ListMoviesInteractorTests: XCTestCase {

    var sut: ListMoviesInteractor!
    var worker: MockListMoviesWorker!
    
    override func setUp() {
        super.setUp()
        PromiseKit.conf.Q.map = nil
        PromiseKit.conf.Q.return = nil
        
        worker = MockListMoviesWorker()
        sut = ListMoviesInteractor(worker: worker)
    }
    
    func testGetPopularMoviesSuccess() {
        let mockPresenter = MockListMoviesPresenter()
        
        stub(mockPresenter) { stub in
            when(stub.presentDynamicData()).thenDoNothing()
        }
        
        stub(worker) { stub in
            when(stub.retrieveMovies(for: any())).then { request -> Promise<ListMovies.Response> in
                let response = ListMovies.Response(page: 1, totalPages: 100, totalResults: 1000, results: [])
                return .value(response)
            }
        }
        
        sut.presenter = mockPresenter
        sut.getMovies(by: .popular)
        
        verify(mockPresenter, times(1)).presentDynamicData()
    }
    
    func testGetPopularMoviesFailure() {
        let mockPresenter = MockListMoviesPresenter()
        
        stub(mockPresenter) { stub in
            when(stub.presentError(any())).thenDoNothing()
        }
        
        stub(worker) { stub in
            when(stub.retrieveMovies(for: any())).then { request -> Promise<ListMovies.Response> in
                return Promise<ListMovies.Response> { seal in
                    seal.reject(NetworkError.mappingError)
                }
            }
        }
        
        sut.presenter = mockPresenter
        sut.getMovies(by: .popular)
        
        verify(mockPresenter, times(1)).presentError(any())
    }
    
    func testDidSelect() {
        let mockPresenter = MockListMoviesPresenter()
        
        stub(mockPresenter) { stub in
            when(stub.presentMovieDetails()).thenDoNothing()
        }
        
        sut.movies = generateFakeMovies()
        sut.presenter = mockPresenter
        sut.didSelectRow(at: 2)
        
        verify(mockPresenter, times(1)).presentMovieDetails()
    }
    
    private func generateFakeMovies() -> [Movie] {
        return [
            Movie(voteCount: 1, id: 1, video: false, voteAverage: 1.1, title: "a-valid-movie-title", popularity: 5.0, posterPath: "a-valid-poster-path", originalLanguage: "origina-language", originalTitle: "original-title", genres: [1], backdropPath: "a-valid-backdrop-path", adult: false, overview: "a-valid-overview", releaseDate: "01/01/1990"),
            Movie(voteCount: 1, id: 1, video: false, voteAverage: 1.1, title: "a-valid-movie-title", popularity: 5.0, posterPath: "a-valid-poster-path", originalLanguage: "origina-language", originalTitle: "original-title", genres: [1], backdropPath: "a-valid-backdrop-path", adult: false, overview: "a-valid-overview", releaseDate: "01/01/1990"),
            Movie(voteCount: 1, id: 1, video: false, voteAverage: 1.1, title: "a-valid-movie-title", popularity: 5.0, posterPath: "a-valid-poster-path", originalLanguage: "origina-language", originalTitle: "original-title", genres: [1], backdropPath: "a-valid-backdrop-path", adult: false, overview: "a-valid-overview", releaseDate: "01/01/1990"),
            Movie(voteCount: 1, id: 1, video: false, voteAverage: 1.1, title: "a-valid-movie-title", popularity: 5.0, posterPath: "a-valid-poster-path", originalLanguage: "origina-language", originalTitle: "original-title", genres: [1], backdropPath: "a-valid-backdrop-path", adult: false, overview: "a-valid-overview", releaseDate: "01/01/1990")
        ]
    }

    override func tearDown() {
        super.tearDown()
        worker = nil
        sut = nil
    }

}
