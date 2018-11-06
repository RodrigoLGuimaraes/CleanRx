//
//  MainMenuReducer.swift
//  CleanRx_Example
//
//  Created by Rodrigo Longhi Guimarães on 24/10/18.
//  Copyright © 2018 Rodrigo Longhi Guimarães. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import CleanRx

class MainMenuReducer: CleanRxReducer {
    
    static var name = "MainMenuReducer"
    
    init() {}
    
    func process<State>(event: CleanRxEvent, currentState: State) -> CleanRxState {
        guard let mainMenuState = currentState as? MainMenuState else {
            return currentState as! CleanRxState
        }
        
        switch event {
        case let buttonClickedEvent as ButtonClickedEvent<MainMenuView.Button>:
            return self.handleButtonClicked(buttonClickedEvent, currentState: mainMenuState) as CleanRxState
        default:
            return mainMenuState as CleanRxState
        }
    }
    
    private func handleButtonClicked(_ event: ButtonClickedEvent<MainMenuView.Button>, currentState: MainMenuState) -> MainMenuState {
        let isToggleFirst = event.payload == .toggleFirstScreenAvailable
        let isToggleSecond = event.payload == .toggleSecondScreenAvailable
        
        let nextFirst = currentState.firstScreenAvailable.toggle(isToggleFirst)
        let nextManual = currentState.secondScreenAvailable.toggle(isToggleSecond)
        
        return currentState.nextState(firstScreenAvailable: nextFirst,
                                      secondScreenAvailable: nextManual)
        
    }
}
