//
//  UserDetailManager.swift
//  IOS Assignment
//
//  Created by SORONIATIS Vasilis on 7/2/24.
//

import Foundation

protocol UsersDetailManagerType {
    func fetchUserData(userID: Int) async ->  Result<UsersDetailModel, MyError>
    func delete(userID: Int) async ->  Result<String, MyError>
}

struct UsersDetailManager: UsersDetailManagerType {
    
    let service: NetworkingServiceType
    
    init(service: NetworkingServiceType) {
        self.service = service
    }
    
    func fetchUserData(userID: Int) async ->  Result<UsersDetailModel, MyError> {
        
        let urlString = "https://gorest.co.in/public-api/users/\(userID)"
        return await service.get(urlString: urlString)

    }
    
    func delete(userID: Int) async ->  Result<String, MyError> {
        let urlString = "https://gorest.co.in/public-api/users/\(userID)"
        return await service.delete(urlString: urlString)

    }
}
