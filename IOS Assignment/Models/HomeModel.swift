//
//  PostData.swift
//  IOS Assignment
//
//  Created by SORONIATIS Vasilis on 17/1/24.
//

import Foundation

struct HomePostResults: Codable {
    
    let data: [HomePostData]
}

struct HomePostData: Codable, Identifiable, Equatable {
    let id: Int
    let user_id: Int
    let title: String
    let body: String
}

struct HomeResponse: Codable {
    let code: Int
    let meta: HomeMetadata
}

struct HomeMetadata: Codable {
    let pagination: HomePagination
}

struct HomePagination: Codable {
    let total, pages, page, limit: Int
}


