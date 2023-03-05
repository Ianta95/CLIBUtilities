//
//  Extensions.swift
//  CLIBUtilities
//
//  Created by Ian Barragan Preciado on 04/03/23.
//

import UIKit

extension UIView {
    func takeScreenshot() -> UIImage? {
        var screenshotImage :UIImage?
        let layer = self.layer
        let scale = UIScreen.main.scale
        UIGraphicsBeginImageContextWithOptions(layer.frame.size, false, scale)
        self.drawHierarchy(in: layer.bounds, afterScreenUpdates: true)
        screenshotImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return screenshotImage
    }
}

extension UIImage {
    var withGrayscale: UIImage {
        guard let ciImage = CIImage(image: self, options: nil) else { return self }
        let paramsColor: [String: AnyObject] = [kCIInputBrightnessKey: NSNumber(value: 0.0), kCIInputContrastKey: NSNumber(value: 1.0), kCIInputSaturationKey: NSNumber(value: 0.0)]
        let grayscale = ciImage.applyingFilter("CIColorControls", parameters: paramsColor)
        guard let processedCGImage = CIContext().createCGImage(grayscale, from: grayscale.extent) else { return self }
        return UIImage(cgImage: processedCGImage, scale: scale, orientation: imageOrientation)
    }
}

extension UIGestureRecognizer {

    typealias Action = ((UIGestureRecognizer) -> ())

    private struct Keys {
        static var actionKey = "ActionKey"
    }

    private var block: Action? {
        set {
            if let newValue = newValue {
                // Computed properties get stored as associated objects
                objc_setAssociatedObject(self, &Keys.actionKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
            }
        }

        get {
            let action = objc_getAssociatedObject(self, &Keys.actionKey) as? Action
            return action
        }
    }

    @objc func handleAction(recognizer: UIGestureRecognizer) {
        block?(recognizer)
    }

    convenience public  init(block: @escaping ((UIGestureRecognizer) -> ())) {
        self.init()
        self.block = block
        self.addTarget(self, action: #selector(handleAction(recognizer:)))
    }
}

