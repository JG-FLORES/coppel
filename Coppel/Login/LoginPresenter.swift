//
//  LoginPresenter.swift
//  Coppel
//
//  Created by JG on 07/03/23.
//

import Foundation

// MARK: LoginPresentation protocol
protocol LoginPresentation {
    func login(user: String, password: String)
    func prepareForRouter()
}

// MARK: LoginPresenter class
class LoginPresenter {
    weak var view: LoginView?
    var interactor: LoginUseCase
    var router: LoginRouting
    
    init(view: LoginView? = nil, interactor: LoginUseCase, router: LoginRouting) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
}

// MARK: LoginPresenter protocol
extension LoginPresenter: LoginPresentation {
    
    func prepareForRouter() {
        self.router.goToHome()
    }
    
    func login(user: String, password: String) {
        interactor.fetchRequest(user: user, password: password) { result in
            switch result {
            case .result(data: let data):
                self.view?.upDate(data: data)
            case .error(str: let str):
                self.view?.error(str: str)
            }
        }
    }
}
