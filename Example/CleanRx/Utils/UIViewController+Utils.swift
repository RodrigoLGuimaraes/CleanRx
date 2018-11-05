//
//  UIViewController+Utils.swift
//  CleanRx_Example
//
//  Created by Rodrigo Longhi Guimarães on 25/10/18.
//  Copyright © 2018 Rodrigo Longhi Guimarães. All rights reserved.
//

import Foundation
import UIKit
import CleanRx

extension UIViewController {
    func showDefaultPopup(with action: PopupAction) {
        let alert = UIAlertController(title: action.title, message: action.message, preferredStyle: .alert)
        for alertAction in action.actions {
            alert.addAction(alertAction)
        }
        self.present(alert, animated: true, completion: action.completionHandler)
    }
}
