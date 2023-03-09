//
//  HomePresenter.swift
//  Coppel
//
//  Created by JG on 07/03/23.
//

import Foundation

// MARK: HomePresentation protocol
protocol HomePresentation {
    func fetch(url: String)
    func goToDetail(detail: Movie)
    func goToProfile()
    func logOut()
}

// MARK: HomePresenter class
class HomePresenter {
    
    weak var view: HomeView?
    var interactor: HomeUserCase
    var router: HomeRouting
    
    init(view: HomeView, interactor: HomeUserCase, router: HomeRouting) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}


// MARK: HomePresenter protocol
extension HomePresenter: HomePresentation {
    
    func logOut() {
        self.router.logOut()
    }
    
    func goToProfile() {
        self.router.goToProfile()
    }
    
    func goToDetail(detail: Movie) {
        self.router.goToDetail(detail: detail)
    }
    
    func fetch(url: String) {
        interactor.fetch(url: url) { result in
            switch result {
            case .succes(data: let data):
                self.view?.upDatePopular(data: data)
            case .failed(string: let string):
                self.view?.error(data: string ?? "")
            }
        }
    }
    
}
