//
//  userPostsModel.swift
//  IOS Assignment
//
//  Created by SORONIATIS Vasilis on 12/2/24.
//

import Foundation


struct UserPostsResults: Codable {
    
    let data: [UserPostsData]
}

struct UserPostsData: Codable, Identifiable {
    let id: Int
    let user_id: Int
    let title: String
    let body: String
}


struct UserPostsResponse: Codable {
    let code: Int
    let meta: UserPostsMetadata
}

struct UserPostsMetadata: Codable {
    let pagination: UserPostsPagination
}

struct UserPostsPagination: Codable {
    let total, pages, page, limit: Int
}
