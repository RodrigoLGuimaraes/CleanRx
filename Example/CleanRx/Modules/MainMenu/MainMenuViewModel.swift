//
//  MainMenuViewModel.swift
//  CleanRx_Example
//
//  Created by Rodrigo Longhi Guimarães on 23/10/18.
//  Copyright © 2018 Rodrigo Longhi Guimarães. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import CleanRx

class MainMenuViewModel: RxArchViewModel {
    
    typealias State = MainMenuState
    
    var stateDriver: Driver<MainMenuState>
    var actionDriver: Driver<UserInterfaceAction>
    
    private let uiEventChannel: PublishRelay<RxArchEvent>
    private let reducer: RxArchReducer
    private let actionEventChannel =  PublishRelay<UserInterfaceAction>()
    private var disposeBag = DisposeBag()
    private var statePubSub = PublishRelay<MainMenuState>()
    
    var currentState: MainMenuState {
        didSet {
            self.statePubSub.accept(self.currentState)
        }
    }
    
    init (reducer: RxArchReducer,
          uiEventChannel: PublishRelay<RxArchEvent>) {
        self.reducer = reducer
        self.uiEventChannel = uiEventChannel
        
        self.currentState = MainMenuState(firstScreenAvailable: true, secondScreenAvailable: true)
        
        self.stateDriver = statePubSub.asDriver(onErrorDriveWith: .empty())
        
        self.actionDriver = actionEventChannel.asDriver(onErrorDriveWith: .empty())
        
        self.initProcessHandling(disposeBag: self.disposeBag,
                                 uiEventChannel: uiEventChannel)
    }
    
    func handle(event: RxArchEvent) {
        self.currentState = reducer.process(event: event, currentState: self.currentState) as! MainMenuState
        self.handleSideEffect(for: event)
    }
    
    func handleSideEffect(for event: RxArchEvent) {
        switch event {
        case let buttonClickedEvent as ButtonClickedEvent<MainMenuView.Button>:
            self.handleButtonClicked(buttonClickedEvent)
        default:
            ()
        }
    }
    
    private func handleButtonClicked(_ event: ButtonClickedEvent<MainMenuView.Button>) {
        switch event.payload {
        case .firstScreen:
            self.actionEventChannel.accept(NavigationAction(payload: MainMenuView.Action.firstScreen))
        case .secondScreen:
            self.actionEventChannel.accept(NavigationAction(payload: MainMenuView.Action.secondScreen))
        case .navCancel:
            self.actionEventChannel.accept(
                PopupAction(title: "Test",
                            message: "test",
                            actions: [
                                UIAlertAction(title: "OK",
                                              style: .default,
                                              handler: nil)
                            ],
                            completionHandler: nil)
            )
        default:
            ()
        }
    }
}
