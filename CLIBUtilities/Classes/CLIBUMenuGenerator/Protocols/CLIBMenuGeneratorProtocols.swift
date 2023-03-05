//
//  CLIBMenuGeneratorProtocols.swift
//  CLIBUtilities
//
//  Created by Ian Barragan Preciado on 04/03/23.
//

import UIKit

protocol CLIBMenuViewInputProtocols: AnyObject {
    func menuView(showMenu data: CLIBMenuViewSendData)
    func menuView(hideMenu data: CLIBMenuViewSendData)
    func menuView(sendFromController data: CLIBMenuViewSendData)
    func menuView(sendFromControllerToOtherController key: String, data: CLIBMenuViewSendData)
    func menuView(changeController key: String, data: CLIBMenuViewSendData)
    func menuView(showLoader completion: @escaping() -> ())
}

protocol CLIBMenuViewOutputProtocols: AnyObject {
    func menuView(sendFromMenu data: CLIBMenuViewSendData)
}

protocol CLIBMenuViewProtocols: AnyObject {
    var containerView: UIView { get set }
    var menuView: UIView { get set }
    var stackMenuView: UIStackView { get set }
    var scrollMenuView: UIScrollView { get set }
    var containerScrollMenu: UIView { get set }
    var titleMenu: NSMutableAttributedString { get set }
    var imgResource: String { get set }
    var primaryColor: UIColor { get set }
    var secondaryColor: UIColor { get set }
    func menuViewGetController() -> UIViewController
    func menuViewAddRootController(controller: UIViewController)
    func menuViewPrepareContainerView()
    func menuViewPrepareUI()
    func menuViewAnimateEnter()
    func menuViewAnimateExit(completionAction: (() -> ())?)
    
    func menuViewChangeController(key: String, data: CLIBMenuViewSendData)
    func menuViewShowLoader(completion: @escaping() -> ())
   
    func menuViewClickMenu()
}

protocol CLIBMenuViewDataModel {
    var viewControllerOptions: [CLIBViewControllerDataModel] { get set }
    var bottomOptions: [CLIBViewControllerDataModel] { get set }
    var photoProfile: UIImage? { get set }
    var attributtedTitle: NSAttributedString? { get set }
    var configs: [CLIBMenuViewConfigs] { get set }
    var specialConfigs: [String:AnyObject]? { get set }
}
