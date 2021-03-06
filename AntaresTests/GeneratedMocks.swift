// MARK: - Mocks generated from file: Antares/Scenes/ListMovies/ListMoviesInteractor.swift at 2019-06-01 20:37:26 +0000

//
//  ListMoviesInteractor.swift
//  Antares
//
//  Created by Leandro Romano on 05/05/19.
//  Copyright (c) 2019 Leandro Romano. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import Cuckoo
@testable import Antares

import UIKit


 class MockListMoviesBusinessLogic: ListMoviesBusinessLogic, Cuckoo.ProtocolMock {
     typealias MocksType = ListMoviesBusinessLogic
     typealias Stubbing = __StubbingProxy_ListMoviesBusinessLogic
     typealias Verification = __VerificationProxy_ListMoviesBusinessLogic

    private var __defaultImplStub: ListMoviesBusinessLogic?

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

     func enableDefaultImplementation(_ stub: ListMoviesBusinessLogic) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }

    

    

    
    
    
     func getMovies(by category: MovieCategory)  {
        
            return cuckoo_manager.call("getMovies(by: MovieCategory)",
                parameters: (category),
                escapingParameters: (category),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.getMovies(by: category))
        
    }
    

	 struct __StubbingProxy_ListMoviesBusinessLogic: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func getMovies<M1: Cuckoo.Matchable>(by category: M1) -> Cuckoo.ProtocolStubNoReturnFunction<(MovieCategory)> where M1.MatchedType == MovieCategory {
	        let matchers: [Cuckoo.ParameterMatcher<(MovieCategory)>] = [wrap(matchable: category) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockListMoviesBusinessLogic.self, method: "getMovies(by: MovieCategory)", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_ListMoviesBusinessLogic: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func getMovies<M1: Cuckoo.Matchable>(by category: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == MovieCategory {
	        let matchers: [Cuckoo.ParameterMatcher<(MovieCategory)>] = [wrap(matchable: category) { $0 }]
	        return cuckoo_manager.verify("getMovies(by: MovieCategory)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}

}

 class ListMoviesBusinessLogicStub: ListMoviesBusinessLogic {
    

    

    
     func getMovies(by category: MovieCategory)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
}



 class MockListMoviesDataStore: ListMoviesDataStore, Cuckoo.ProtocolMock {
     typealias MocksType = ListMoviesDataStore
     typealias Stubbing = __StubbingProxy_ListMoviesDataStore
     typealias Verification = __VerificationProxy_ListMoviesDataStore

    private var __defaultImplStub: ListMoviesDataStore?

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

     func enableDefaultImplementation(_ stub: ListMoviesDataStore) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }

    

    

    

	 struct __StubbingProxy_ListMoviesDataStore: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	}

	 struct __VerificationProxy_ListMoviesDataStore: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	}

}

 class ListMoviesDataStoreStub: ListMoviesDataStore {
    

    

    
}



 class MockListMoviesInteractor: ListMoviesInteractor, Cuckoo.ClassMock {
     typealias MocksType = ListMoviesInteractor
     typealias Stubbing = __StubbingProxy_ListMoviesInteractor
     typealias Verification = __VerificationProxy_ListMoviesInteractor

    private var __defaultImplStub: ListMoviesInteractor?

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

     func enableDefaultImplementation(_ stub: ListMoviesInteractor) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }

    
    
    
     override var presenter: ListMoviesPresentationLogic? {
        get {
            return cuckoo_manager.getter("presenter",
                superclassCall:
                    
                    super.presenter
                    ,
                defaultCall: __defaultImplStub!.presenter)
        }
        
        set {
            cuckoo_manager.setter("presenter",
                value: newValue,
                superclassCall:
                    
                    super.presenter = newValue
                    ,
                defaultCall: __defaultImplStub!.presenter = newValue)
        }
        
    }
    
    
    
     override var worker: ListMoviesWorker? {
        get {
            return cuckoo_manager.getter("worker",
                superclassCall:
                    
                    super.worker
                    ,
                defaultCall: __defaultImplStub!.worker)
        }
        
        set {
            cuckoo_manager.setter("worker",
                value: newValue,
                superclassCall:
                    
                    super.worker = newValue
                    ,
                defaultCall: __defaultImplStub!.worker = newValue)
        }
        
    }
    

    

    
    
    
     override func getMovies(by category: MovieCategory)  {
        
            return cuckoo_manager.call("getMovies(by: MovieCategory)",
                parameters: (category),
                escapingParameters: (category),
                superclassCall:
                    
                    super.getMovies(by: category)
                    ,
                defaultCall: __defaultImplStub!.getMovies(by: category))
        
    }
    

	 struct __StubbingProxy_ListMoviesInteractor: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    var presenter: Cuckoo.ClassToBeStubbedProperty<MockListMoviesInteractor, ListMoviesPresentationLogic?> {
	        return .init(manager: cuckoo_manager, name: "presenter")
	    }
	    
	    var worker: Cuckoo.ClassToBeStubbedProperty<MockListMoviesInteractor, ListMoviesWorker?> {
	        return .init(manager: cuckoo_manager, name: "worker")
	    }
	    
	    
	    func getMovies<M1: Cuckoo.Matchable>(by category: M1) -> Cuckoo.ClassStubNoReturnFunction<(MovieCategory)> where M1.MatchedType == MovieCategory {
	        let matchers: [Cuckoo.ParameterMatcher<(MovieCategory)>] = [wrap(matchable: category) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockListMoviesInteractor.self, method: "getMovies(by: MovieCategory)", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_ListMoviesInteractor: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	    var presenter: Cuckoo.VerifyProperty<ListMoviesPresentationLogic?> {
	        return .init(manager: cuckoo_manager, name: "presenter", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    var worker: Cuckoo.VerifyProperty<ListMoviesWorker?> {
	        return .init(manager: cuckoo_manager, name: "worker", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	    @discardableResult
	    func getMovies<M1: Cuckoo.Matchable>(by category: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == MovieCategory {
	        let matchers: [Cuckoo.ParameterMatcher<(MovieCategory)>] = [wrap(matchable: category) { $0 }]
	        return cuckoo_manager.verify("getMovies(by: MovieCategory)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}

}

 class ListMoviesInteractorStub: ListMoviesInteractor {
    
     override var presenter: ListMoviesPresentationLogic? {
        get {
            return DefaultValueRegistry.defaultValue(for: (ListMoviesPresentationLogic?).self)
        }
        
        set { }
        
    }
    
     override var worker: ListMoviesWorker? {
        get {
            return DefaultValueRegistry.defaultValue(for: (ListMoviesWorker?).self)
        }
        
        set { }
        
    }
    

    

    
     override func getMovies(by category: MovieCategory)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
}

