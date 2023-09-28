//
//  Utilities.swift
//
//
//  Created by Kamil Wójcicki on 28/09/2023.
//

import Foundation
import UIKit

internal protocol UtilitiesProtocol {
    func topViewController(controller: UIViewController?) -> UIViewController?
}

internal final class Utilities: UtilitiesProtocol {
    
//    static let shared = Utilities()
//    private init() { }
    
    @MainActor
    func topViewController(controller: UIViewController? = nil) -> UIViewController? {
        let controller = controller ?? UIApplication.shared.keyWindow?.rootViewController
        
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(controller: selected)
            }
        }
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        return controller
    }
}
