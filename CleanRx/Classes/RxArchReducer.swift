//
//  RxArchReducer.swift
//  RxArch
//
//  Created by Rodrigo Longhi Guimarães on 24/10/18.
//  Copyright © 2018 Rodrigo Longhi Guimarães. All rights reserved.
//

import Foundation

public protocol RxArchReducer {
    static var name: String { get }
    func process<State>(event: RxArchEvent, currentState: State) -> RxState where State: RxState
}
