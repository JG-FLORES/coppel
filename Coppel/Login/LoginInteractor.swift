//
//  LoginInteractor.swift
//  Coppel
//
//  Created by JG on 07/03/23.
//

import Foundation

enum ServiceResult {
    case result(data: Login)
    case error(str: String)
}

typealias ServiceCompletion = (_ result: ServiceResult) -> ()

protocol LoginUseCase {
    func fetchRequest(user: String, password: String, callback: @escaping ServiceCompletion)
}

class LoginInteractor {
}

extension LoginInteractor: LoginUseCase {
    func fetchRequest(user: String, password: String, callback: @escaping ServiceCompletion) {
        guard let url = URL(string: "\(Network.token)?api_key=\(Network.APIKey)") else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                callback(.error(str: "Ah ocurrido una falla"))
                return
            }
            do {
                if let string = String(bytes: data, encoding: .utf8) {
                    print(string)
                }
                
                let response = try JSONDecoder().decode(ResultResponse.self, from: data)
                
                if response.success {
                    let uploadDataModel = UploadData(username: user, password: password, request_token: response.request_token)
                    guard let jsonData = try? JSONEncoder().encode(uploadDataModel) else { return }
                    
                    let url = URL(string: "\(Network.login)?api_key=\(Network.APIKey)")
                    
                    var request = URLRequest(url: url!)
                    request.httpMethod = "POST"
                    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                    request.setValue("application/json", forHTTPHeaderField: "Accept")
                    request.httpBody = jsonData
                    
                    URLSession.shared.dataTask(with: request) { data, response, error in
                        guard let data = data, error == nil else { return }
                        do {
                            if let string = String(bytes: data, encoding: .utf8) {
                                print(string)
                            }
                            
                            let entities = try JSONDecoder().decode(Login.self, from: data)
                            callback(.result(data: entities))
                        }
                        catch {
                        }
                    }.resume()
                }
            }
            catch {
            }
        }
        task.resume()
    }
}
