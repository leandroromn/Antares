//
//  ListMoviesRouter.swift
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

@objc protocol ListMoviesRoutingLogic {
    //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol ListMoviesDataPassing {
    var dataStore: ListMoviesDataStore? { get }
}

class ListMoviesRouter: NSObject, ListMoviesRoutingLogic, ListMoviesDataPassing {

    weak var viewController: ListMoviesViewController?
    var dataStore: ListMoviesDataStore?

    // MARK: Routing

    /*
    func routeToSomewhere(segue: UIStoryboardSegue?) {
        if let segue = segue {
            let destinationVC = segue.destination as! SomewhereViewController
            var destinationDS = destinationVC.router!.dataStore!
            passDataToSomewhere(source: dataStore!, destination: &destinationDS)
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
            var destinationDS = destinationVC.router!.dataStore!
            passDataToSomewhere(source: dataStore!, destination: &destinationDS)
            navigateToSomewhere(source: viewController!, destination: destinationVC)
        }
    }
    */

    // MARK: Navigation

    /*
    func navigateToSomewhere(source: ListMoviesViewController, destination: SomewhereViewController) {
        source.show(destination, sender: nil)
    }
    */

    // MARK: Passing data

    /*
    func passDataToSomewhere(source: ListMoviesDataStore, destination: inout SomewhereDataStore) {
        destination.name = source.name
    }
    */

}