//
//  MyAwesomeButton.swift
//  CleanRx_Example
//
//  Created by Rodrigo Longhi Guimarães on 23/10/18.
//  Copyright © 2018 Rodrigo Longhi Guimarães. All rights reserved.
//

import UIKit

class MyAwesomeButton: UIButton {

    override func willMove(toWindow newWindow: UIWindow?) {
        self.layoutIfNeeded()
        
        guard let bgImageView = self.subviews.first else {
            return
        }
        bgImageView.contentMode = .scaleAspectFill
        bgImageView.clipsToBounds = true
        
        self.layer.cornerRadius = 5
        self.clipsToBounds = true
        
        let mask = UIView()
        mask.isUserInteractionEnabled = false
        mask.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        self.addSubview(mask)
        mask.prepareForConstraints()
        mask.pinEdgesToSuperview()
        
        self.sendSubview(toBack: mask)
        self.sendSubview(toBack: bgImageView)
    }
    
}
