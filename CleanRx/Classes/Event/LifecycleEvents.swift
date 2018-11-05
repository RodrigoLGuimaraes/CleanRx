//
//  LifecycleEvents.swift
//  RxArch
//
//  Created by Rodrigo Longhi Guimarães on 23/10/18.
//  Copyright © 2018 Rodrigo Longhi Guimarães. All rights reserved.
//

import Foundation

public struct ViewDidLoadEvent: RxArchEvent {}
public struct ViewWillLayoutSubviews: RxArchEvent {}
public struct ViewDidLayoutSubviews: RxArchEvent {}
public struct ViewWillAppear: RxArchEvent {}
public struct ViewDidAppearEvent: RxArchEvent {}
public struct viewLayoutMarginsDidChange: RxArchEvent {}
public struct viewSafeAreaInsetsDidChange: RxArchEvent {}
public struct ViewWillDisappear: RxArchEvent {}
public struct ViewDidDisappear: RxArchEvent {}
