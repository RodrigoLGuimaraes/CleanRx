//
//  AppCoordinator.swift
//  CleanRx_Example
//
//  Created by Rodrigo Longhi Guimarães on 23/10/18.
//  Copyright © 2018 Rodrigo Longhi Guimarães. All rights reserved.
//

import Foundation
import Swinject

class AppCoordinator: Coordinator {
    let window: UIWindow
    let container: Container
    let navigationController: UINavigationController
    
    init(window: UIWindow,
         container: Container) {
        self.window = window
        self.container = container
        self.navigationController = UINavigationController()
    }
    
    func start() {
        self.configureRootNavigationController()
        self.showMainMenu()
    }
    
    func configureRootNavigationController() {
        self.window.rootViewController = self.navigationController
    }
    
    func showMainMenu() {
        let mainMenuView = self.container.resolve(MainMenuView.self)!
        mainMenuView.delegate = self
        self.navigationController.pushViewController(mainMenuView, animated: false)
    }
}

extension AppCoordinator: MainMenuViewDelegate {
    func didCallForFirstScreen() {
        print("NAVIGATION >>> MOVE TO FIRST SCREEN")
    }
    
    func didCallForSecondScreen() {
        print("NAVIGATION >>> MOVE TO SECOND SCREEN")
    }
    
    func didCallForCancel() {
        print("NAVIGATION >>> DISMISS MAIN MENU")
    }
    
    
}
