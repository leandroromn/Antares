//
//  ListMoviesPresenterTests.swift
//  AntaresTests
//
//  Created by Leandro Romano on 03/06/19.
//  Copyright © 2019 Leandro Romano. All rights reserved.
//

import XCTest
import Cuckoo
import Nimble

@testable import Antares

class ListMoviesPresenterTests: XCTestCase {
    
    var sut: ListMoviesPresenter!
    
    override func setUp() {
        super.setUp()
        sut = ListMoviesPresenter()
    }
    
    func testPresentMovies() {
        let mockViewController = MockListMoviesDisplayLogic()
        
        stub(mockViewController) { stub in
            when(stub.displayMovies(viewModel: any())).thenDoNothing()
        }
        
        sut.viewController = mockViewController
        
        let listMoviesResponse = ListMovies.Response(page: 1, totalPages: 100, totalResults: 1000, results: [])
        sut.presentMovies(response: listMoviesResponse)
        
        verify(mockViewController, times(1)).displayMovies(viewModel: any())
    }
    
    func testPresentError() {
        let mockViewController = MockListMoviesDisplayLogic()
        
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
