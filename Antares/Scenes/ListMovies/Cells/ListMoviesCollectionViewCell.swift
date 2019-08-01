//
//  ListMoviesCollectionViewCell.swift
//  Antares
//
//  Created by Leandro Romano on 25/06/19.
//  Copyright © 2019 Leandro Romano. All rights reserved.
//

import UIKit
import SDWebImage

class ListMoviesCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "listMoviesCollectionViewCell"
    
    @IBOutlet weak var moviePosterImageView: UIImageView!
    
    func configure(_ viewModel: ListMovies.ViewModel) {
        moviePosterImageView.sd_imageIndicator = SDWebImageActivityIndicator.grayLarge
        moviePosterImageView.sd_setImage(with: URL(string: AntaresUtils.getCoverImageBy(path: viewModel.posterPath, withSize: .original)))
        
        [self, moviePosterImageView].forEach { view in
            view?.layer.shadowColor = UIColor.gray.cgColor
            view?.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
            view?.layer.cornerRadius = 14
            view?.layer.shadowRadius = 4
            view?.layer.shadowOpacity = 1
        }
    }

}
