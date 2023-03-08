//
//  DetailPresenter.swift
//  Coppel
//
//  Created by JG on 07/03/23.
//

import Foundation

protocol DetailPresentation {
    
}

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

extension DetailPresenter: DetailPresentation {
    
}
