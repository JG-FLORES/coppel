//
//  DetailRouter.swift
//  Coppel
//
//  Created by JG on 07/03/23.
//

import UIKit

protocol DetailRouting {
    
}

class DetailRouter {
    
    let view: UIViewController
    
    init(view: UIViewController) {
        self.view = view
    }
}

extension DetailRouter: DetailRouting {
    
}
