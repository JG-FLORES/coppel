//
//  LoginRouter.swift
//  Coppel
//
//  Created by JG on 07/03/23.
//

import UIKit

// MARK: LoginRouting protocol
protocol LoginRouting {
    func goToHome()
}

// MARK: LoginRouter class
class LoginRouter {
    
    var view: UIViewController
    
    init(view: UIViewController) {
        self.view = view
    }
}

// MARK: LoginRouter protocol
extension LoginRouter: LoginRouting {
    func goToHome() {
        let prefs = UserDefaults.standard
        prefs.set(1, forKey: "ISLOGGEDIN")
        prefs.synchronize()
        
        let vc = HomeAssembly.build()
        self.view.navigationController?.pushViewController(vc, animated: true)
    }
}
