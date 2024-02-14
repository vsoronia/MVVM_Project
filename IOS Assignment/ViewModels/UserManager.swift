//
//  UserManager.swift
//  IOS Assignment
//
//  Created by SORONIATIS Vasilis on 6/2/24.
//

import Foundation

struct UserManager {
    
    let service: NetworkingService
    
    init(service: NetworkingService = NetworkingService()) {
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
