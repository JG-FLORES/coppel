//
//  ProfilePresenter.swift
//  Coppel
//
//  Created by JG on 07/03/23.
//

import Foundation

protocol ProfilePresentation {
    func profile()
}


class ProfilePresenter {
    
    weak var view: ProfileView?
    var interactor: ProfileUserCase
    var router: ProfileRouting
    
    init(view: ProfileView, interactor: ProfileUserCase, router: ProfileRouting) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension ProfilePresenter: ProfilePresentation {
    
    func profile() {
        interactor.fetch { result in
            switch result {
                
            case .succes(data: let data):
                self.view?.upDateProfile(user: data)
            case .failed(string: let string):
                self.view?.error(error: string ?? "")
            }
        }
    }
}
