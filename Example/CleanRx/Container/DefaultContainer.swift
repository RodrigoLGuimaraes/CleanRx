//
//  DefaultContainer.swift
//  CleanRx_Example
//
//  Created by Rodrigo Longhi Guimarães on 23/10/18.
//  Copyright © 2018 Rodrigo Longhi Guimarães. All rights reserved.
//

import Foundation
import Swinject
import CleanRx

final class DefaultContainer {
    let container: Container
    
    init() {
        self.container = Container()
        self.registerReducers()
        self.registerViews()
    }
}

extension DefaultContainer {
    func registerViews() {
        self.container.register(MainMenuView.self) { resolver in
            return MainMenuView(
                reducer: resolver.resolve(CleanRxReducer.self, name: MainMenuReducer.name)!
            )
        }
    }
    
    func registerReducers() {
        self.container.register(CleanRxReducer.self, name: MainMenuReducer.name) { (_) in
            return MainMenuReducer()
        }
    }
}
