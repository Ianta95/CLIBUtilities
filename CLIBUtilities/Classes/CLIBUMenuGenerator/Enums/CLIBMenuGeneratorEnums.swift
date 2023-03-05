//
//  CLIBMenuSendData.swift
//  CLIBUtilities
//
//  Created by Ian Barragan Preciado on 04/03/23.
//

import UIKit

public enum CLIBMenuViewGesture {
    case screenEdgeGesture(pattern: CLIBMenuViewGestureDrawPattern)
}

public enum CLIBMenuViewPosition {
    case topLeftGrid3x3
    case topMiddleGrid3x3
    case topRightGrid3x3
    case centerLeftGrid3x3
    case centerMiddleGrid3x3
    case centerRightGrid3x3
    case bottomLeftGrid3x3
    case bottomCenterGrid3x3
    case bottomRightGrid3x3
    case spaceTopLeftGrid4x4
    case spaceTopMiddle1Grid4x4
    case spaceTopMiddle2Grid4x4
    case spaceTopRightGrid4x4
    case spaceCenter1LeftGrid4x4
    case spaceCenter1Middle1Grid4x4
    case spaceCenter1Middle2Grid4x4
    case spaceCenter1RightGrid4x4
    case spaceCenter2LeftGrid4x4
    case spaceCenter2Middle1Grid4x4
    case spaceCenter2Middle2Grid4x4
    case spaceCenter2RightGrid4x4
    case spaceBottomLeftGrid4x4
    case spaceBottomMiddle1Grid4x4
    case spaceBottomMiddle2Grid4x4
    case spaceBottomRightGrid4x4
    case customOrigin(x: Double, y: Double)
}

public enum CLIBMenuViewConfigs {
    case setTitle(attributtedTitle: NSMutableAttributedString)
    case setOptions(options: [CLIBViewControllerDataModel])
    case primaryColor(color: UIColor)
    case secondColor(color: UIColor)
    case animationDuration(duration: CGFloat, delay: CGFloat = 0.0)
    case setImage(image: UIImage?)
    case menuIcon(icon: UIImage?)
    case setOrderInOptions(imageLeftTextRight: Bool)
    case asignButtonForMenu(icon: UIImage?, dimensions: CGSize?, position: CLIBMenuViewPosition)
    case asignGestureForMenu(gesture: CLIBMenuViewGesture)
    
}

public enum CLIBMenuViewSendData {
    case none
    case data(data: AnyObject?)
}
