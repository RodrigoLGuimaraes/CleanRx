//
//  GeneralEvents.swift
//  RxArch
//
//  Created by Rodrigo Longhi Guimarães on 23/10/18.
//  Copyright © 2018 Rodrigo Longhi Guimarães. All rights reserved.
//

import Foundation

public struct FunctionCalledEvent: RxArchEvent {
    public let functionName: String
}

public struct ButtonClickedEvent<T>: RxArchEvent{
    public let payload: T
}

public struct RxArch {
    public static func clickEvent<T>(_ payload: T) -> ButtonClickedEvent<T> {
        return ButtonClickedEvent(payload: payload)
    }
}
