//
//  ProfileInteractor.swift
//  Coppel
//
//  Created by JG on 07/03/23.
//

import Foundation

enum ResultUser {
    case succes(data: User)
    case failed(string: String?)
}

enum ResultFavorite {
    case succes(data: [Movie])
    case failed(string: String?)
}

typealias CompletionUser = (_ result: ResultUser) -> ()
typealias CompletionFavorite = (_ result: ResultFavorite) -> ()

protocol ProfileUserCase {
    func fetch(callback: @escaping CompletionUser)
    func fetchFavorite(callback: @escaping CompletionFavorite)
}

class ProfileInteractor {
    
}

extension ProfileInteractor: ProfileUserCase {
    
    func fetchFavorite(callback: @escaping CompletionFavorite) {
        guard let url = URL(string: "\(Network.account)/{account_id}/favorite/movies?api_key=\(Network.APIKey)&language=en-US&sort_by=created_at.asc&page=1") else { return }
        
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
    
    
    func fetch(callback: @escaping CompletionUser) {
        guard let url = URL(string: "\(Network.account)?api_key=\(Network.APIKey)") else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                callback(.failed(string: "Ah fallado..."))
                return
            }
            do {
                if let string = String(bytes: data, encoding: .utf8) {
                    print(string)
                }
                
                let entities = try JSONDecoder().decode(User.self, from: data)
                callback(.succes(data: entities))
            }
            catch {
                callback(.failed(string: "Ah fallado..3322..."))
            }
        }
        task.resume()
    }
}
