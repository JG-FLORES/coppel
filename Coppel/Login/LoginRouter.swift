//
//  LoginRouter.swift
//  Coppel
//
//  Created by JG on 07/03/23.
//

import UIKit

protocol LoginRouting {
    func goToHome()
}

class LoginRouter {
    
    var view: UIViewController
    
    init(view: UIViewController) {
        self.view = view
    }
}

extension LoginRouter: LoginRouting {
    func goToHome() {
        let vc = HomeAssembly.build()
        self.view.navigationController?.pushViewController(vc, animated: true)
    }
}
