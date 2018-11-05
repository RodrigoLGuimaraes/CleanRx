//
//  UserInterfaceAction.swift
//  RxArch
//
//  Created by Rodrigo Longhi Guimarães on 25/10/18.
//  Copyright © 2018 Rodrigo Longhi Guimarães. All rights reserved.
//

import Foundation
import UIKit

public protocol UserInterfaceAction {}

public struct NavigationAction<T>: UserInterfaceAction, Equatable where T: Equatable {
    public let payload: T
    
    public init(payload: T) {
        self.payload = payload
    }
}

public struct PopupAction: UserInterfaceAction {
    public let title: String
    public let message: String
    public let actions: [UIAlertAction]
    public let completionHandler: (() -> Void)?
    
    public init(title: String,
                message: String,
                actions: [UIAlertAction],
                completionHandler: (() -> Void)? = nil) {
        self.title = title
        self.message = message
        self.actions = actions
        self.completionHandler = completionHandler
    }
}
