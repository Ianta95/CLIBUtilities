//
//  CLIBMenuGenerator+Protocols.swift
//  CLIBUtilities
//
//  Created by Ian Barragan Preciado on 04/03/23.
//

import UIKit

public extension CLIBMenuGeneratorController: CLIBMenuViewProtocols {
    func menuViewGetController() -> UIViewController {
        return self
    }
    
    func menuViewAddRootController(controller: UIViewController) {
        self.addChild(controller)
        self.containerView.addSubview(controller.view)
        controller.view.frame = self.containerView.bounds
        controller.view.layer.cornerRadius = 40
        controller.view.clipsToBounds = true
        controller.view.topAnchor.constraint(equalTo: self.containerView.topAnchor).isActive = true
        controller.view.leftAnchor.constraint(equalTo: self.containerView.leftAnchor).isActive = true
        controller.view.rightAnchor.constraint(equalTo: self.containerView.rightAnchor).isActive = true
        controller.view.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor).isActive = true
        controller.didMove(toParent: self)
    }
    
    func menuViewPrepareContainerView() {
        self.view.addSubview(self.shadowContainerView)
        self.shadowContainerView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        self.shadowContainerView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        self.shadowContainerView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
        self.shadowContainerView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        self.shadowContainerView.layer.cornerRadius = 40
        self.shadowContainerView.clipsToBounds = true
        self.view.addSubview(self.containerView)
        self.containerView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        self.containerView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        self.containerView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
        self.containerView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        self.containerView.layer.cornerRadius = 40
        self.containerView.clipsToBounds = true
    }
    
    func menuViewPrepareUI() {
        self.view.addSubview(scrollMenuView)
        scrollMenuView.addSubview(containerScrollMenu)
        scrollMenuView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        scrollMenuView.widthAnchor.constraint(equalToConstant: self.view.frame.width * 0.52).isActive = true
        scrollMenuView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollMenuView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        containerScrollMenu.centerXAnchor.constraint(equalTo: self.scrollMenuView.centerXAnchor).isActive = true
        containerScrollMenu.widthAnchor.constraint(equalTo: self.scrollMenuView.widthAnchor).isActive = true
        containerScrollMenu.topAnchor.constraint(equalTo: self.scrollMenuView.topAnchor).isActive = true
        containerScrollMenu.bottomAnchor.constraint(equalTo: self.scrollMenuView.bottomAnchor).isActive = true
        containerScrollMenu.heightAnchor.constraint(greaterThanOrEqualTo: self.view.heightAnchor, multiplier: 0.8).isActive = true
        let scrollTranslation = scrollMenuView.transform.translatedBy(x: -(self.view.frame.width * 0.52) , y: 0)
        scrollMenuView.transform = scrollTranslation
        scrollMenuView.alpha = 0
        containerScrollMenu.addSubview(imgMenuView)
        imgMenuView.topAnchor.constraint(equalTo: containerScrollMenu.topAnchor, constant: 22).isActive = true
        imgMenuView.leftAnchor.constraint(equalTo: containerScrollMenu.leftAnchor, constant: 22).isActive = true
        imgMenuView.rightAnchor.constraint(equalTo: containerScrollMenu.rightAnchor, constant: -22).isActive = true
        imgMenuView.widthAnchor.constraint(equalTo: imgMenuView.heightAnchor).isActive = true
        containerScrollMenu.addSubview(titleLabl)
        titleLabl.topAnchor.constraint(equalTo: imgMenuView.bottomAnchor, constant: 12).isActive = true
        titleLabl.leftAnchor.constraint(equalTo: containerScrollMenu.leftAnchor, constant: 22).isActive = true
        titleLabl.rightAnchor.constraint(equalTo: containerScrollMenu.rightAnchor, constant: -22).isActive = true
        titleLabl.heightAnchor.constraint(greaterThanOrEqualToConstant: 24).isActive = true
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = secondaryColor
        view.heightAnchor.constraint(equalToConstant: 2).isActive = true
        containerScrollMenu.addSubview(view)
        view.topAnchor.constraint(equalTo: titleLabl.bottomAnchor, constant: 12).isActive = true
        view.leftAnchor.constraint(equalTo: containerScrollMenu.leftAnchor, constant: 22).isActive = true
        view.rightAnchor.constraint(equalTo: containerScrollMenu.rightAnchor, constant: -22).isActive = true
        self.arrayOfLines.append(view)
        containerScrollMenu.addSubview(stackMenuView)
        stackMenuView.heightAnchor.constraint(greaterThanOrEqualToConstant: 30).isActive = true
        stackMenuView.topAnchor.constraint(equalTo: view.bottomAnchor, constant: 12).isActive = true
        stackMenuView.leftAnchor.constraint(equalTo: containerScrollMenu.leftAnchor, constant: 22).isActive = true
        stackMenuView.rightAnchor.constraint(equalTo: containerScrollMenu.rightAnchor, constant: -22).isActive = true
    }
    
    func menuViewAnimateEnter() {
        self.shadowContainerView.image = self.containerView.takeScreenshot()?.withGrayscale
        //let translation = self.containerView.transform.scaledBy(x: 0.76, y: 0.76).translatedBy(x: self.view.frame.width * 0.8, y: self.view.frame.height * 0.02).rotated(by: -(CGFloat(Double.pi) * 0.03))
        let shadowtranslation = self.shadowContainerView.transform.scaledBy(x: 0.66, y: 0.66).translatedBy(x: self.view.frame.width * 0.72, y: self.view.frame.height * 0.014).rotated(by: -(CGFloat(Double.pi) * 0.05))
        UIView.animate(withDuration: 0.4, delay: 0.0, options: [.curveEaseInOut]) {
            for view in self.containerView.subviews {
                let subviewTranslation = view.transform.scaledBy(x: 0.76, y: 0.76).translatedBy(x: self.view.frame.width * 0.8, y: self.view.frame.height * 0.02).rotated(by: -(CGFloat(Double.pi) * 0.03))
                view.transform = subviewTranslation
            }
            //self.containerView.transform = translation
            self.containerView.isUserInteractionEnabled = false
            self.scrollMenuView.transform = .identity
            self.scrollMenuView.alpha = 1
            self.shadowContainerView.transform = shadowtranslation
            self.view.layoutIfNeeded()
        } completion: { _ in
            
        }

    }
    
    func menuViewAnimateExit(completionAction: (() -> ())?) {
        let scrollTranslation = scrollMenuView.transform.translatedBy(x: -(self.view.frame.width * 0.52) , y: 0)
        UIView.animate(withDuration: 0.4, delay: 0.0, options: [.curveEaseInOut]) {
            //self.containerView.transform = .identity
            self.shadowContainerView.transform = .identity
            for view in self.containerView.subviews {
                view.transform = .identity
            }
            self.containerView.isUserInteractionEnabled = true
            self.scrollMenuView.alpha = 0
            self.scrollMenuView.transform = scrollTranslation
            self.view.layoutIfNeeded()
        } completion: { _ in
            completionAction?()
        }
    }
    
    
    
    func menuViewChangeController(key: String, data: CLIBMenuViewSendData) {
        
    }
    
    func menuViewShowLoader(completion: @escaping () -> ()) {
        
    }
    
    func menuViewClickMenu() {
        
    }
}
