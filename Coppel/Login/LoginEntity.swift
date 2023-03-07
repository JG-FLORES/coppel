//
//  LoginEntity.swift
//  Coppel
//
//  Created by JG on 07/03/23.
//

import Foundation

struct Login: Codable {
    var success: Bool
    var status_message: String
}


struct ResultResponse: Codable {
    var request_token: String
    var success: Bool
}

struct UploadData: Codable {
    let username: String
    let password: String
    let request_token: String
}
