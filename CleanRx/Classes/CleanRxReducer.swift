//
//  RxArchReducer.swift
//  RxArch
//
//  Created by Rodrigo Longhi Guimarães on 24/10/18.
//  Copyright © 2018 Rodrigo Longhi Guimarães. All rights reserved.
//

import Foundation

public protocol CleanRxReducer {
    static var name: String { get }
    func process<State>(event: CleanRxEvent, currentState: State) -> CleanRxState where State: CleanRxState
}
