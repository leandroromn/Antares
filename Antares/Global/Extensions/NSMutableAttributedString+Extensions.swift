//
//  NSMutableAttributedString+Extensions.swift
//  Antares
//
//  Created by Leandro Romano on 31/07/19.
//  Copyright © 2019 Leandro Romano. All rights reserved.
//

import UIKit

extension NSMutableAttributedString {
    
    @discardableResult func normal(_ text: String) -> NSMutableAttributedString {
        append(NSAttributedString(string: text))
        return self
    }
    
    @discardableResult func light(_ text: String, fontSize: CGFloat) -> NSMutableAttributedString {
        let mutableString = applyAttributes(UIFont.systemFont(ofSize: fontSize, weight: .light), text)
        append(mutableString)
        return self
    }
    
    @discardableResult func bold(_ text: String, fontSize: CGFloat) -> NSMutableAttributedString {
        let mutableString = applyAttributes(UIFont.boldSystemFont(ofSize: fontSize), text)
        append(mutableString)
        return self
    }
    
    private func applyAttributes(_ font: UIFont, _ text: String) -> NSMutableAttributedString {
        let attrs: [NSAttributedString.Key: Any] = [.font: font]
        return NSMutableAttributedString(string: text, attributes: attrs)
    }

}
