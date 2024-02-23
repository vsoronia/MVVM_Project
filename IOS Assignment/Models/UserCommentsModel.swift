//
//  UserCommentsModel.swift
//  IOS Assignment
//
//  Created by SORONIATIS Vasilis on 23/2/24.
//

import Foundation

struct UserCommentsResults: Codable {

    let data: [UserCommentsData]
}

struct UserCommentsData: Codable, Identifiable {
    let id, postID: Int
    let name, email, body: String
}

struct UserCommentsResponse: Codable {
    let code: Int
    let meta: UserPostsMetadata
}

struct UserCommentsMetaData: Codable {
    let pagination: UserCommentsPagination
}

struct UserCommentsPagination: Codable {
    let total, pages, page, limit: Int
}
