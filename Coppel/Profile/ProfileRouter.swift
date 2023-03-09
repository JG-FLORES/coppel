//
//  ProfileRouter.swift
//  Coppel
//
//  Created by JG on 07/03/23.
//

import UIKit

// MARK: ProfileRouting Protocol
protocol ProfileRouting {
    
}

// MARK: ProfileRouter Class
class ProfileRouter {
    
    let view: UIViewController
    
    init(view: UIViewController) {
        self.view = view
    }
}

// MARK: ProfileRouter Protocol
extension ProfileRouter: ProfileRouting {
    
}
