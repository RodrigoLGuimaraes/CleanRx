//
//  Bool+Utils.swift
//  CleanRx_Example
//
//  Created by Rodrigo Longhi Guimarães on 05/11/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation

extension Bool {
    func toggle(_ toggle: Bool = true) -> Bool {
        return toggle ? !self : self
    }
}
