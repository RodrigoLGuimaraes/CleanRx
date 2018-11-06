//
//  RxArchViewModel.swift
//  RxArch
//
//  Created by Rodrigo Longhi Guimarães on 24/10/18.
//  Copyright © 2018 Rodrigo Longhi Guimarães. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

public protocol CleanRxViewModel {
    associatedtype State
    
    var stateDriver: Driver<State> { get set }
    var actionDriver: Driver<UserInterfaceAction> { get set }
    var currentState: State { get set }
    func handle(event: CleanRxEvent)
}

extension CleanRxViewModel {
    public func initProcessHandling(disposeBag: DisposeBag,
                             uiEventChannel: PublishRelay<CleanRxEvent>? = nil) {
        if let `uiEventChannel` = uiEventChannel {
            uiEventChannel.subscribe(onNext: { (uiEvent) in
                self.handle(event: uiEvent)
            }).disposed(by: disposeBag)
        }
    }
}
