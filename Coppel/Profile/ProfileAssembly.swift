//
//  ProfileAssembly.swift
//  Coppel
//
//  Created by JG on 07/03/23.
//

import UIKit

class ProfileAssembly {
    
    static func build() -> UIViewController {
        let view = ProfileViewController(nibName: "ProfileViewController", bundle: Bundle.main)
        
        let interactor = ProfileInteractor()
        let router = ProfileRouter(view: view)
        let presenter = ProfilePresenter(view: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        
        return view
    }
}
