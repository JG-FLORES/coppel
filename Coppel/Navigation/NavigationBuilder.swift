//
//  NavigationBuilder.swift
//  Coppel
//
//  Created by JG on 07/03/23.
//

import UIKit

typealias NavigationFactory = (UIViewController) -> (UINavigationController)

class NavigationBuilder {
    
    static func build(root: UIViewController) -> UINavigationController{
        let navigationController = UINavigationController(rootViewController: root)
        return navigationController
    }
}
