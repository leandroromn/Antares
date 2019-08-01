//
//  URL+Extensions.swift
//  Antares
//
//  Created by Leandro Romano on 30/07/19.
//  Copyright © 2019 Leandro Romano. All rights reserved.
//

import UIKit

extension String {
    
    func getCoverImageWith(size imageSize: MovieCoverSize) -> URL {
        return URL(string: AntaresUtils.getCoverImageBy(path: self, withSize: imageSize))!
    }
    
    func setLineSpacing(spacing: CGFloat, lineHeightMultiple: CGFloat, alignment: NSTextAlignment = .center) -> NSAttributedString {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = alignment
        paragraphStyle.lineSpacing = spacing
        paragraphStyle.lineHeightMultiple = lineHeightMultiple
        let attributedString = NSAttributedString(string: self, attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        return attributedString
    }
    
}
