//
//  MainMenuView.swift
//  CleanRx_Example
//
//  Created by Rodrigo Longhi Guimarães on 23/10/18.
//  Copyright © 2018 Rodrigo Longhi Guimarães. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import CleanRx

protocol MainMenuViewDelegate: class {
    func didCallForFirstScreen()
    func didCallForSecondScreen()
    func didCallForCancel()
}

class MainMenuView: UIViewController, RxArchController {
    
    enum Button {
        case firstScreen
        case secondScreen
        case navCancel
        case toggleFirstScreenAvailable
        case toggleSecondScreenAvailable
    }
    
    enum Action {
        case firstScreen
        case secondScreen
        case cancel
    }
    
    weak var delegate: MainMenuViewDelegate?
    
    typealias State = MainMenuState

    @IBOutlet weak var firstScreenButton: MyAwesomeButton!
    @IBOutlet weak var secondScreenButton: MyAwesomeButton!
    @IBOutlet weak var cancelButton: MyAwesomeButton!
    
    @IBOutlet weak var toggleFirstScreenButton: UIButton!
    @IBOutlet weak var toggleSecondScreenButton: UIButton!
    
    var viewModel: MainMenuViewModel!
    var uiEventChannel = PublishRelay<RxArchEvent>()
    let reducer: RxArchReducer
    
    init(reducer: RxArchReducer) {
        self.reducer = reducer
        super.init(nibName: "MainMenuView", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureViews()
        self.setupEvents()
        self.setupViewModel()
        self.startRender(stateDriver: self.viewModel.stateDriver,
                         actionDriver: self.viewModel.actionDriver,
                         disposeBag: rx.disposeBag)
        
        notifyLifeCycle()
    }
    
    func configureViews() {
        //Set up phrase app keys here, for example
    }
    
    func setupViewModel() {
        self.viewModel = MainMenuViewModel(
            reducer: self.reducer,
            uiEventChannel: self.uiEventChannel
        )
    }
    
    func setupEvents() {
        let events = Driver.merge([
            firstScreenButton.rx.tap.asEventDriver(RxArch.clickEvent(Button.firstScreen)),
            secondScreenButton.rx.tap.asEventDriver(RxArch.clickEvent(Button.secondScreen)),
            cancelButton.rx.tap.asEventDriver(RxArch.clickEvent(Button.navCancel)),
            toggleFirstScreenButton.rx.tap.asEventDriver(RxArch.clickEvent(Button.toggleFirstScreenAvailable)),
            toggleSecondScreenButton.rx.tap.asEventDriver(RxArch.clickEvent(Button.toggleSecondScreenAvailable))
        ])
        
        events.drive(onNext: { (event) in
            self.uiEventChannel.accept(event)
        }).disposed(by: rx.disposeBag)
    }
    
    func render(_ state: MainMenuState) {
        UIView.animate(withDuration: 0.3) {
            self.firstScreenButton.isHidden = !state.firstScreenAvailable
            self.secondScreenButton.isHidden = !state.secondScreenAvailable
            self.view.layoutIfNeeded()
        }
    }
    
    func handleAction(_ action: UserInterfaceAction) {
        switch action {
        case let navigationAction as NavigationAction<Action>:
            self.handleNavigationAction(navigationAction.payload)
        case let popupAction as PopupAction:
            self.showDefaultPopup(with: popupAction)
        default:
            ()
        }
    }
    
    func handleNavigationAction(_ action: Action) {
        switch action {
        case .firstScreen:
            self.delegate?.didCallForFirstScreen()
        case .secondScreen:
            self.delegate?.didCallForSecondScreen()
        case .cancel:
            self.delegate?.didCallForCancel()
        }
    }
}
