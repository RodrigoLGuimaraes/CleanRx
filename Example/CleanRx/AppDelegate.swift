//
//  AppDelegate.swift
//  CleanRx_Example
//
//  Created by Rodrigo Longhi Guimarães on 05/11/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import Swinject
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var defaultContainer: DefaultContainer!
    var appCoordinator: AppCoordinator!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.defaultContainer = DefaultContainer()
        
        let currentWindow = UIWindow(frame: UIScreen.main.bounds)
        self.appCoordinator = AppCoordinator(window: currentWindow,
                                             container: self.defaultContainer.container)
        self.appCoordinator?.start()
        self.window = currentWindow
        self.window?.makeKeyAndVisible()
        
        IQKeyboardManager.shared.enable = true
        
        return true
    }
    
}

