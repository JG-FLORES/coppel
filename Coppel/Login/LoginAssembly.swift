//
//  LoginAssembly.swift
//  Coppel
//
//  Created by JG on 07/03/23.
//

import UIKit

// MARK: LoginAssembly protocol
class LoginAssembly {
    
    static func buildNavigation(usingNavigationFactory factory: NavigationFactory) -> UINavigationController {
        let view = LoginViewController(nibName: "LoginViewController", bundle: Bundle.main)

        let interactor = LoginInteractor()
        let router = LoginRouter(view: view)
        let presenter = LoginPresenter(view: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        
        return factory(view)
    }
    
    static func build() -> UIViewController {
        let view = LoginViewController(nibName: "LoginViewController", bundle: Bundle.main)

        let interactor = LoginInteractor()
        let router = LoginRouter(view: view)
        let presenter = LoginPresenter(view: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        
        return view
    }
}
