//
//  HomeRouter.swift
//  Coppel
//
//  Created by JG on 07/03/23.
//

import UIKit

protocol HomeRouting {
    func goToDetail(detail: Movie)
    func goToProfile()
    func logOut()
}

class HomeRouter {
    
    let view: UIViewController
    
    init(view: UIViewController) {
        self.view = view
    }
}

extension HomeRouter: HomeRouting {
    
    func logOut() {
        let appDomain = Bundle.main.bundleIdentifier
        UserDefaults.standard.removePersistentDomain(forName: appDomain!)
        
        let vc = LoginAssembly.build()
        self.view.navigationController?.pushViewController(vc, animated: true)
    }
    
    func goToProfile() {
        let vc = ProfileAssembly.build()
        self.view.present(vc, animated: true)
    }
    
    func goToDetail(detail: Movie) {
        let vc = DetailAssembly.build(detail: detail)
        self.view.navigationController?.pushViewController(vc, animated: true)
    }
}
