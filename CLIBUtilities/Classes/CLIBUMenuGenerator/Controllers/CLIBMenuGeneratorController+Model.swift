//
//  CLIBMenuGeneratorController+Model.swift
//  CLIBUtilities
//
//  Created by Ian Barragan Preciado on 04/03/23.
//

import UIKit

extension CLIBMenuGeneratorController {
    public struct Model {
        var options: [CLIBViewControllerDataModel]
        var bottomOptions: [CLIBViewControllerDataModel]
        var configs: [CLIBMenuViewConfigs]
        var specialConfigs: [String:AnyObject]? = nil
    }
}
