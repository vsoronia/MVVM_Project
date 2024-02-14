//
//  UsersDetailModel.swift
//  IOS Assignment
//
//  Created by SORONIATIS Vasilis on 6/2/24.
//

import Foundation


struct UsersDetailModel: Codable {
    let code: Int
    let data: DetailsData
}


struct DetailsData: Codable {
    let id: Int
    let name, email, gender, status: String
}

