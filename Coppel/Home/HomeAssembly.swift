//
//  HomeAssembly.swift
//  Coppel
//
//  Created by JG on 07/03/23.
//

import UIKit

// MARK: HomeAssembly class
class HomeAssembly {
    
    static func build() -> UIViewController {
        let view = HomeViewController(nibName: "HomeViewController", bundle: Bundle.main)
        
        let interactor = HomeInteractor()
        let router = HomeRouter(view: view)
        let presenter = HomePresenter(view: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        
        return view
    }
    
    static func buildNavigation(usingNavigationFactory factory: NavigationFactory) -> UINavigationController {
        let view = HomeViewController(nibName: "HomeViewController", bundle: Bundle.main)
        
        let interactor = HomeInteractor()
        let router = HomeRouter(view: view)
        let presenter = HomePresenter(view: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        
        return factory(view)
    }

}

