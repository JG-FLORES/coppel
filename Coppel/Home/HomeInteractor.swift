//
//  HomeInteractor.swift
//  Coppel
//
//  Created by JG on 07/03/23.
//

import Foundation

enum Result {
    case succes(data: [Movie])
    case failed(string: String?)
}

typealias Completion = (_ result: Result) -> ()

// MARK: HomeUserCase protocol
protocol HomeUserCase {
    func fetch(url: String, callback: @escaping Completion)
}

// MARK: HomeInteractor class
class HomeInteractor {
    
}

// MARK: HomeInteractor protocol
extension HomeInteractor: HomeUserCase {
        
    func fetch(url: String, callback: @escaping Completion) {
        guard let url = URL(string: url) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                callback(.failed(string: "Ah ocurrido una falla"))
                return
            }
            do {
                let entities = try JSONDecoder().decode(Movies.self, from: data)
                callback(.succes(data: entities.results))
            }
            catch {
                callback(.failed(string: "Ah ocurrido una falla"))
            }
        }
        task.resume()
    }
}
