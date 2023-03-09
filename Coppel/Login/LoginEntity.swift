//
//  LoginEntity.swift
//  Coppel
//
//  Created by JG on 07/03/23.
//

import Foundation

// MARK: Login struct
struct Login: Codable {
    var success: Bool
    var status_message: String
}


// MARK: ResultResponse struct
struct ResultResponse: Codable {
    var request_token: String
    var success: Bool
}

// MARK: UploadData struct
struct UploadData: Codable {
    let username: String
    let password: String
    let request_token: String
}
