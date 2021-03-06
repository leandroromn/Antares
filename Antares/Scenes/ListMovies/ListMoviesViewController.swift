//
//  ListMoviesViewController.swift
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
import SDWebImage

protocol ListMoviesDisplayLogic: class {
    func displayDynamicData()
    func displayError(_ error: Error)
    func displayMovieDetails()
}

class ListMoviesViewController: UIViewController {
    
    var interactor: ListMoviesBusinessLogic?
    var router: (NSObjectProtocol & ListMoviesRoutingLogic & ListMoviesDataPassing)?
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    private func setup() {
        let viewController = self
        let interactor = ListMoviesInteractor()
        let presenter = ListMoviesPresenter()
        let router = ListMoviesRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: - View Cycles

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        requestMovies()
    }
    
    fileprivate func setupView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorColor = .clear
        tableView.backgroundColor = .black
        tableView.register(
            UINib(nibName: R.nib.movieItemTableViewCell.name, bundle: R.nib.movieItemTableViewCell.bundle),
            forCellReuseIdentifier: MovieItemTableViewCell.identifier
        )
        tableView.tableHeaderView = R.nib.movieListHeaderView.firstView(owner: nil)
    }
    
    func requestMovies() {
        interactor?.getMovies(by: .nowPlaying)
    }

}

extension ListMoviesViewController: ListMoviesDisplayLogic {
    
    func displayDynamicData() {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    func displayError(_ error: Error) {
        let alertController = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Close", style: .cancel))
        present(alertController, animated: true)
    }
    
    func displayMovieDetails() {
        router?.routeToDetails()
    }
    
}

extension ListMoviesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return interactor?.numberOfItems ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: MovieItemTableViewCell.identifier, for: indexPath) as? MovieItemTableViewCell
        else { return UITableViewCell() }
        
        cell.configure(interactor?.cellForItem(at: indexPath.row))
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        interactor?.didSelectRow(at: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 450
    }
    
}
