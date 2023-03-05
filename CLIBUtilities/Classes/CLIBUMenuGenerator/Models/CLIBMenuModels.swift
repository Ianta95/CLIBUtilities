//
//  CLIBMenuModels.swift
//  CLIBUtilities
//
//  Created by Ian Barragan Preciado on 04/03/23.
//

import UIKit

public struct CLIBMenuViewGestureDrawKeyPosition {
    let maxX: Double
    let minX: Double
    let maxY: Double
    let minY: Double
    private var isDone: Bool = false
    
    public init(minX: Double, maxX: Double, minY: Double, maxY: Double){
        self.minX = minX
        self.maxX = maxX
        self.minY = minY
        self.maxY = maxY
    }
    
    func validatePoint(point: CGPoint) {
        
    }
    
    mutating func setDone() {
        self.isDone = true
    }
}

public struct CLIBMenuViewGestureDrawPattern {
    private let patternOriginal: [CLIBMenuViewGestureDrawKeyPosition]
    private var patternValidation: [CLIBMenuViewGestureDrawKeyPosition]
    private var returnToOriginalPoint: Bool = true
    private var continueValidation: Bool = true
    private var originalPoint: CGPoint? = nil
    var drawPatternClosure: (() -> ())?
    
    public init(pattern: [CLIBMenuViewGestureDrawKeyPosition], returnToOriginalPoint: Bool = true) {
        self.patternOriginal = pattern
        self.patternValidation = pattern
        self.returnToOriginalPoint = returnToOriginalPoint
    }
    
    mutating func startDrawing(point: CGPoint){
        if self.originalPoint == nil {
            self.originalPoint = point
            self.continueValidation = true
            print("Start Time")
        }
    }
    
    mutating func validatePoint(point: CGPoint) {
        if self.continueValidation {
            print("Validate Time")
            validateWithPoint(point: point)
        }
    }
    
    mutating private func validateWithPoint(point: CGPoint) {
        if let nextPattern = getPatternToValidate(point: point) {
            print("XX-> El punto es ", nextPattern)
            print("XX-> Punto a evaluar es ", point)
            if point.x >= nextPattern.minX && point.x <= nextPattern.maxX && point.y >= nextPattern.minY && point.y <= nextPattern.maxY {
                print("Borro el siguiente punto")
                self.patternValidation.removeFirst()
            }
        } else {
            print("No hay punto")
        }
        if self.patternValidation.count  < 1 {
            print("Dibujo el pattern")
            self.continueValidation = false
            drawPatternClosure?()
        }
        
    }
    
    mutating private func getPatternToValidate(point: CGPoint) -> CLIBMenuViewGestureDrawKeyPosition? {
        return self.patternValidation.first
    }
    
    mutating func finishPoint(point: CGPoint) {
        self.continueValidation = false
        self.originalPoint = nil
        self.patternValidation = patternOriginal
    }
    
}

struct CLIBViewControllerDataModel {
    var key: String
    var icon: UIImage? = nil
    var title: String
    var controller: UIViewController? = nil
//    var action: (() -> ())? = nil
    private var index = 0
    var delegate: CLIBMenuViewOutputProtocols? = nil
    var transitionStyle: UIModalTransitionStyle = .crossDissolve
    var presentationStyle: UIModalPresentationStyle = .overCurrentContext
    var isPresentNewController: Bool = false
   
    
    public init(key: String,
         icon: UIImage? = nil,
         title: String,
         controller: UIViewController? = nil,
         action: ( () -> Void)? = nil,
         index: Int = 0,
         delegate: CLIBMenuViewOutputProtocols? = nil,
         transitionStyle: UIModalTransitionStyle = .crossDissolve,
         presentationStyle: UIModalPresentationStyle = .overCurrentContext,
         isPresentNewController: Bool = false) {
        self.key = key
        self.icon = icon
        self.title = title
        self.controller = controller
//        self.action = action
        self.index = index
        self.delegate = delegate
        self.transitionStyle = transitionStyle
        self.presentationStyle = presentationStyle
        self.isPresentNewController = isPresentNewController
    }
    
    func getIndex() -> Int {
        return index
    }
}
