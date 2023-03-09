//
//  DetailPresenter.swift
//  Coppel
//
//  Created by JG on 07/03/23.
//

import Foundation

// MARK: DetailPresentation Protocol
protocol DetailPresentation {
    
}

// MARK: DetailPresenter class
class DetailPresenter {
    
    weak var view: DetailView?
    var interactor: DetailUserCase
    var router: DetailRouting
    
    init(view: DetailView, interactor: DetailUserCase, router: DetailRouting) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

// MARK: DetailPresenter Protocol
extension DetailPresenter: DetailPresentation {
    
}
