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
    }

}
