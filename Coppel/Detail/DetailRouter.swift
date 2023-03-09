//
//  DetailRouter.swift
//  Coppel
//
//  Created by JG on 07/03/23.
//

import UIKit

// MARK: DetailRouting Protocol
protocol DetailRouting {
    
}

// MARK: DetailRouter class
class DetailRouter {
    
    let view: UIViewController
    
    init(view: UIViewController) {
        self.view = view
    }
}

// MARK: DetailRouter Protocol
extension DetailRouter: DetailRouting {
    
}
