//
//  UIButton+Rx.swift
//  CleanRx_Example
//
//  Created by Rodrigo Longhi Guimarães on 25/10/18.
//  Copyright © 2018 Rodrigo Longhi Guimarães. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import CleanRx

extension ControlEvent {
    func asEventDriver<T>(_ event: T) -> Driver<CleanRxEvent> where T: CleanRxEvent {
        let voidSignal = self.map { _ in return ()}
        return voidSignal.asDriver(onErrorJustReturn: ()).map {
            _ in return event
        }
    }
}

