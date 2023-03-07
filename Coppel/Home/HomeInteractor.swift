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

protocol HomeUserCase {
    func fetch(url: String, callback: @escaping Completion)
}

class HomeInteractor {
    
}

extension HomeInteractor: HomeUserCase {
        
    func fetch(url: String, callback: @escaping Completion) {
        guard let url = URL(string: url) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                callback(.failed(string: "Ah fallado..."))
                return
            }
            do {
                if let string = String(bytes: data, encoding: .utf8) {
                    print(string)
                }
                
                let entities = try JSONDecoder().decode(Movies.self, from: data)
                callback(.succes(data: entities.results))
            }
            catch {
                callback(.failed(string: "Ah fallado..3322..."))
            }
        }
        task.resume()
    }
}
