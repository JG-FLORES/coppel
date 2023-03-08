//
//  ProfileViewController.swift
//  Coppel
//
//  Created by JG on 07/03/23.
//

import UIKit

protocol ProfileView: AnyObject {
    func upDateProfile(user: User)
    func error(error: String)
}

class ProfileViewController: UIViewController {

    var presenter: ProfilePresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ProfileViewController: ProfileView {
    
    func upDateProfile(user: User) {
        
    }
    
    func error(error: String) {
        
    }
}
