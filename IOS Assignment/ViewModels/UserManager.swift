//
//  UserManager.swift
//  IOS Assignment
//
//  Created by SORONIATIS Vasilis on 6/2/24.
//

import Foundation

protocol UserManagerType {
    func fetchPageInfo() async ->  Result<UsersResponse, MyError>
    func fetchUsers(for page: Int) async ->  Result<UsersResults, MyError>
}

struct UserManager: UserManagerType {
    
    let service: NetworkingServiceType
    
    init(service: NetworkingServiceType) {
        self.service = service
    }
    
    func fetchPageInfo() async ->  Result<UsersResponse, MyError> {
        
        let urlString = "https://gorest.co.in/public-api/users"
        return await service.get(urlString: urlString)
    }
    
    func fetchUsers(for page: Int) async ->  Result<UsersResults, MyError> {
        let urlString = "https://gorest.co.in/public-api/users?page=\(page)"
        return await service.get(urlString: urlString)

    }
}
