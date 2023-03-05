//
//  CLIBMenuViewModel.swift
//  CLIBUtilities
//
//  Created by Ian Barragan Preciado on 04/03/23.
//

import UIKit

struct CLIBMenuViewModel: CLIBMenuViewDataModel {
    var viewControllerOptions: [CLIBViewControllerDataModel] {
        didSet {
            print("Se asignaron controllers")
        }
    }
    var bottomOptions: [CLIBViewControllerDataModel]
    var photoProfile: UIImage?
    var attributtedTitle: NSAttributedString?
    var configs: [CLIBMenuViewConfigs]
    var specialConfigs: [String : AnyObject]?
    var edgeGestureDrawPattern: CLIBMenuViewGestureDrawPattern? = nil
    
    func prepareViewController(menu: CLIBMenuViewProtocols, startIndex: Int = 0){
        menu.menuViewPrepareContainerView()
        menu.menuViewPrepareUI()
        menu.menuViewGetController().navigationController?.setNavigationBarHidden(true, animated: false)
        let isIndexInOptions = viewControllerOptions.reduce(into: false) { $0 = $1.getIndex() == startIndex ? true : $0 }
        let addController: UIViewController = viewControllerOptions.reduce(into: UIViewController()) { $0 = $1.getIndex() == startIndex ? $1.controller ?? UIViewController() : $0}
        menu.menuViewAddRootController(controller: addController)
        self.prepareOptions(menu: menu)
    }
    
    mutating func applyConfigurations(menu: CLIBMenuViewProtocols) {
        let controller = menu.menuViewGetController()
        for config in configs {
            self.applyConfiguration(menu: menu, config: config)
        }
    }
    
    private mutating func applyConfiguration(menu: CLIBMenuViewProtocols, config: CLIBMenuViewConfigs){
        switch config {
        case .setTitle(let attributtedTitle):
            menu.titleMenu = attributtedTitle
            break
        case .setOptions(let options):
            break
        case .primaryColor(let color):
            menu.primaryColor = color
            break
        case .secondColor(let color):
            menu.secondaryColor = color
            break
        case .animationDuration(let duration, let delay):
            break
        case .setImage(let image):
            break
        case .menuIcon(let icon):
            break
        case .setOrderInOptions(let imageLeftTextRight):
            break
        case .asignButtonForMenu(icon: let icon, dimensions: let dimensions, position: let position):
            break
        case .asignGestureForMenu(let gesture):
            addGestureRecognizer(menu: menu, gesture: gesture)
            break
        }
    }
    
    private mutating func addGestureRecognizer(menu: CLIBMenuViewProtocols, gesture: CLIBMenuViewGesture) {
        switch gesture {
        case .screenEdgeGesture(let pattern):
            addEdgeScreenGestureRecognizer(menu: menu, pattern: pattern)
            break
        }
    }
    
    private mutating func addEdgeScreenGestureRecognizer(menu: CLIBMenuViewProtocols, pattern: CLIBMenuViewGestureDrawPattern) {
        var pattern = pattern
        pattern.drawPatternClosure = {
            menu.menuViewAnimateEnter()
        }
        var gesture = UIScreenEdgePanGestureRecognizer { gesture in
            print("Edge draw location: ", gesture.location(in: menu.menuViewGetController().view))
            switch gesture.state {
            case .possible:
                break
            case .began:
                pattern.startDrawing(point: gesture.location(in: menu.menuViewGetController().view))
                break
            case .changed:
                pattern.validatePoint(point: gesture.location(in: menu.menuViewGetController().view))
                break
            case .ended:
                pattern.finishPoint(point: gesture.location(in: menu.menuViewGetController().view))
                break
            case .cancelled:
                break
            case .failed:
                break
            @unknown default:
                break
            }
            print("Edge state", gesture.state.rawValue)
        }
        gesture.edges = [.right]

        menu.menuViewGetController().view.addGestureRecognizer(gesture)
        self.edgeGestureDrawPattern = pattern
    }
    
    private func prepareOptions(menu: CLIBMenuViewProtocols){
        for option in viewControllerOptions {
            let optionView = CLIBCustomElegantCell1View(title: option.title, imgResource: option.icon)
            optionView.action = {
                if option.isPresentNewController {
                    var controller = option.controller
                    controller?.modalTransitionStyle = option.transitionStyle
                    controller?.modalPresentationStyle = option.presentationStyle
                    if let controller = controller {
                        menu.menuViewGetController().present(controller, animated: true)
                    }
                } else {
                    addNewController(menu: menu, index: option.getIndex())
                }
            }
            menu.stackMenuView.addArrangedSubview(optionView)
        }
        if bottomOptions.count > 0 {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = .white
            view.heightAnchor.constraint(equalToConstant: 2).isActive = true
            menu.stackMenuView.addArrangedSubview(view)
        }
        for option in bottomOptions {
            let optionView = CLIBCustomElegantCell1View(title: option.title, imgResource: option.icon)
            optionView.action = {
                if option.isPresentNewController {
                    var controller = option.controller
                    controller?.modalTransitionStyle = option.transitionStyle
                    controller?.modalPresentationStyle = option.presentationStyle
                    if let controller = controller {
                        menu.menuViewGetController().present(controller, animated: true)
                    }
                } else {
                    
                }
            }
            menu.stackMenuView.addArrangedSubview(optionView)
        }
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.heightAnchor.constraint(equalToConstant: 2).isActive = true
        menu.stackMenuView.addArrangedSubview(view)
        let optionClose = CLIBCustomElegantCell1View(title: "Cerrar", imgResource: nil)
        optionClose.action = {
            menu.menuViewAnimateExit(completionAction: nil)
        }
        menu.stackMenuView.addArrangedSubview(optionClose)
    }
    
    private func addNewController(menu: CLIBMenuViewProtocols, index: Int){
        let action = {
            for view in menu.containerView.subviews {
                view.removeFromSuperview()
            }
            let addController: UIViewController = viewControllerOptions.reduce(into: UIViewController()) { $0 = $1.getIndex() == index ? $1.controller ?? UIViewController() : $0}
            menu.menuViewAddRootController(controller: addController)
        }
        menu.menuViewAnimateExit(completionAction: action)
    }
}
