//
//  DetailAssembly.swift
//  Coppel
//
//  Created by JG on 07/03/23.
//

import UIKit

// MARK: DetailAssembly class
class DetailAssembly {
    
    static func build(detail: Movie) -> UIViewController {
        let view = DetailViewController(nibName: "DetailViewController", bundle: Bundle.main)
        
        let interactor = DetailInteractor()
        let router = DetailRouter(view: view)
        let presenter = DetailPresenter(view: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        view.detail = detail
        
        return view
    }
}
