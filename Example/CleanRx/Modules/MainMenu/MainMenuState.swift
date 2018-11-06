//
//  MainMenuState.swift
//  CleanRx_Example
//
//  Created by Rodrigo Longhi Guimarães on 23/10/18.
//  Copyright © 2018 Rodrigo Longhi Guimarães. All rights reserved.
//

import Foundation
import CleanRx

struct MainMenuState: CleanRxState, Equatable {
    let firstScreenAvailable: Bool
    let secondScreenAvailable: Bool
    
    func nextState(firstScreenAvailable: Bool? = nil,
                   secondScreenAvailable: Bool? = nil) -> MainMenuState {
        
        return MainMenuState(firstScreenAvailable: firstScreenAvailable ?? self.firstScreenAvailable, secondScreenAvailable: secondScreenAvailable ?? self.secondScreenAvailable
        )
    }
}
