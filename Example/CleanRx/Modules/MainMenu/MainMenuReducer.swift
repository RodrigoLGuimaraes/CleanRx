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

class MainMenuReducer: RxArchReducer {
    
    static var name = "MainMenuReducer"
    
    init() {}
    
    func process<State>(event: RxArchEvent, currentState: State) -> RxState {
        guard let mainMenuState = currentState as? MainMenuState else {
            return currentState as! RxState
        }
        
        switch event {
        case let buttonClickedEvent as ButtonClickedEvent<MainMenuView.Button>:
            return self.handleButtonClicked(buttonClickedEvent, currentState: mainMenuState) as! RxState
        default:
            return mainMenuState as! RxState
        }
    }
    
    private func handleButtonClicked(_ event: ButtonClickedEvent<MainMenuView.Button>, currentState: MainMenuState) -> MainMenuState {
        let isToggleVideo = event.payload == .toggleFirstScreenAvailable
        let isToggleManual = event.payload == .toggleSecondScreenAvailable
        
        let nextVideo = (isToggleVideo && !currentState.firstScreenAvailable) || (!isToggleVideo && currentState.firstScreenAvailable)
        let nextManual = (isToggleManual && !currentState.secondScreenAvailable) || (!isToggleManual && currentState.secondScreenAvailable)
        
        return currentState.nextState(firstScreenAvailable: nextManual,
                                      secondScreenAvailable: nextVideo)
        
    }
}
