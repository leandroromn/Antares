//
//  MovieItemTableViewCell.swift
//  Antares
//
//  Created by Leandro Romano on 17/08/19.
//  Copyright © 2019 Leandro Romano. All rights reserved.
//

import UIKit
import SDWebImage

class MovieItemTableViewCell: UITableViewCell {
    
    static let identifier = "movieItemCell"

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleEffectView: UIVisualEffectView!
    @IBOutlet weak var voteEffectView: UIVisualEffectView!
    @IBOutlet weak var voteAverageLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    lazy var views = [containerView, posterImageView, titleEffectView, voteEffectView, voteAverageLabel, titleLabel]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
        containerView.backgroundColor = .clear
        
//        containerView.layer.shadowColor = UIColor.gray.cgColor
//        containerView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
//        containerView.layer.shadowRadius = 8.0
//        containerView.layer.shadowOpacity = 0.8
        
        posterImageView.layer.cornerRadius = 16.0
//        blurEffectView.layer.cornerRadius = 16.0
        
        titleEffectView.subviews.forEach {
            $0.layer.cornerRadius = 16.0
            $0.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
            $0.layoutSubviews()
        }
        
        voteEffectView.subviews.forEach {
            $0.layer.cornerRadius = voteEffectView.frame.size.width/2
            $0.layoutSubviews()
        }
        
        hideViews()
    }
    
    func configure(_ viewModel: ListMovies.ViewModel?) {
        guard let viewModel = viewModel else { return }
        
        posterImageView.sd_imageIndicator = SDWebImageActivityIndicator.whiteLarge
        posterImageView.sd_setImage(with: viewModel.posterPath.getCoverImageWith(size: .original))
        
        titleLabel.text = viewModel.title
        voteAverageLabel.text = viewModel.voteAverage
        
        displayViews()
    }

    private func hideViews() {
        views.forEach { $0?.alpha = 0.0 }
    }
    
    private func displayViews() {
        UIView.animate(withDuration: 0.25) {
            self.views.forEach { $0?.alpha = 1.0 }
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        hideViews()
    }
    
}
