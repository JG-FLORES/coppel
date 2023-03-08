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

typealias CompletionUser = (_ result: ResultUser) -> ()

protocol ProfileUserCase {
    func fetch(callback: @escaping CompletionUser)
}

class ProfileInteractor {
    
}

extension ProfileInteractor: ProfileUserCase {
    
    func fetch(callback: @escaping CompletionUser) {
        guard let url = URL(string: "") else { return }
        
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
