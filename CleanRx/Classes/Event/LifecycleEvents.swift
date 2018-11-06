//
//  LifecycleEvents.swift
//  RxArch
//
//  Created by Rodrigo Longhi Guimarães on 23/10/18.
//  Copyright © 2018 Rodrigo Longhi Guimarães. All rights reserved.
//

import Foundation

public struct ViewDidLoadEvent: CleanRxEvent {}
public struct ViewWillLayoutSubviews: CleanRxEvent {}
public struct ViewDidLayoutSubviews: CleanRxEvent {}
public struct ViewWillAppear: CleanRxEvent {}
public struct ViewDidAppearEvent: CleanRxEvent {}
public struct viewLayoutMarginsDidChange: CleanRxEvent {}
public struct viewSafeAreaInsetsDidChange: CleanRxEvent {}
public struct ViewWillDisappear: CleanRxEvent {}
public struct ViewDidDisappear: CleanRxEvent {}
