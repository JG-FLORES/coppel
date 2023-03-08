//
//  ProfileRouter.swift
//  Coppel
//
//  Created by JG on 07/03/23.
//

import UIKit

protocol ProfileRouting {
    
}

class ProfileRouter {
    
    let view: UIViewController
    
    init(view: UIViewController) {
        self.view = view
    }
}

extension ProfileRouter: ProfileRouting {
    
}
