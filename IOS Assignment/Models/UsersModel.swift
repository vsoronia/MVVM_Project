//
//  UsersModel.swift
//  IOS Assignment
//
//  Created by SORONIATIS Vasilis on 5/2/24.
//

import Foundation


struct UsersResults: Codable {
    
    let data: [UsersData]
}

struct UsersData: Codable, Identifiable, Equatable {
    let id: Int
    let name, email: String
    let gender: String
    let status: Status
}


enum Status: String, Codable {
    case active = "active"
    case inactive = "inactive"
}

struct UsersResponse: Codable {
    let code: Int
    let meta: UsersMetadata
}

struct UsersMetadata: Codable {
    let pagination: UsersPagination
}

struct UsersPagination: Codable {
    let total: Int
    let pages: Int
    let page: Int
    let limit: Int
}
