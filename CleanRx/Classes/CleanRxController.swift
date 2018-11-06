//
//  RxArchController.swift
//  RxArch
//
//  Created by Rodrigo Longhi Guimarães on 23/10/18.
//  Copyright © 2018 Rodrigo Longhi Guimarães. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import CleanRx

public protocol CleanRxController: class {
    associatedtype State
    var uiEventChannel: PublishRelay<CleanRxEvent> { get set }
    func render(_ state: State)
    func handleAction(_ action: UserInterfaceAction)
}

extension CleanRxController {
    public func notifyFunctionCalled(callingFunctionName: String = #function) {
        uiEventChannel.accept(
            FunctionCalledEvent(functionName: callingFunctionName)
        )
    }
    
    public func notifyLifeCycle(callingFunctionName: String = #function) {
        switch callingFunctionName {
        case "viewDidLoad()":
            uiEventChannel.accept(ViewDidLoadEvent())
        case "viewWillLayoutSubviews()":
            uiEventChannel.accept(ViewWillLayoutSubviews())
        case "viewDidLayoutSubviews()":
            uiEventChannel.accept(ViewDidLayoutSubviews())
        case "viewWillAppear()":
            uiEventChannel.accept(ViewWillAppear())
        case "viewDidAppearEvent()":
            uiEventChannel.accept(ViewDidAppearEvent())
        case "viewLayoutMarginsDidChange()":
            uiEventChannel.accept(viewLayoutMarginsDidChange())
        case "viewSafeAreaInsetsDidChange()":
            uiEventChannel.accept(viewSafeAreaInsetsDidChange())
        case "viewWillDisappear()":
            uiEventChannel.accept(ViewWillDisappear())
        case "viewDidDisappear()":
            uiEventChannel.accept(ViewDidDisappear())
        default:
            uiEventChannel.accept(
                FunctionCalledEvent(functionName: callingFunctionName)
            )
        }
    }
    
    public func buttonClickedEvent<T>(_ payload: T) -> ButtonClickedEvent<T> {
        return ButtonClickedEvent<T>(payload: payload)
    }
    
    public func startRender(stateDriver: Driver<State>, actionDriver: Driver<UserInterfaceAction>, disposeBag: DisposeBag) {
        stateDriver.drive(onNext: { (state) in
            self.render(state)
        }).disposed(by: disposeBag)
        
        actionDriver.drive(onNext: { (action) in
            self.handleAction(action)
        }).disposed(by: disposeBag)
    }
}
