//
//  ToDosModel.swift
//  IOS Assignment
//
//  Created by SORONIATIS Vasilis on 8/2/24.
//

import Foundation

struct ToDosResults: Codable {
    
    let data: [ToDosData]
}

struct ToDosData: Codable, Identifiable {
    let id, user_id: Int
    let title, due_on: String
    let status: TaskStatus
}

enum TaskStatus: String, Codable {
    case completed = "completed"
    case pending = "pending"
}

struct ToDosResponse: Codable{
    let code: Int
    let meta: ToDosMetaData
}
struct ToDosMetaData: Codable {
    
    let pagination: ToDosPagination
}

struct ToDosPagination: Codable {
    let total, pages, page, limit: Int
}
