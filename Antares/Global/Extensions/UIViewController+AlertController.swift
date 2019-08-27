//
//  UIViewController+AlertController.swift
//  Antares
//
//  Created by Leandro Romano on 25/06/19.
//  Copyright © 2019 Leandro Romano. All rights reserved.
//

import UIKit

typealias EmptyClosure = (()->())

extension UIViewController {
    
    func displayAlert(title: String, message: String, buttonTitle: String, action: EmptyClosure? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: buttonTitle, style: .default) { _ in
            action?()
        }
        alertController.addAction(action)
        present(alertController, animated: true)
    }
    
}
