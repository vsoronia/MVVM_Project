//
//  UserPostsManager.swift
//  IOS Assignment
//
//  Created by SORONIATIS Vasilis on 12/2/24.
//

import Foundation

struct UserPostsManager {
    
    let service: NetworkingService
    
    init(service: NetworkingService = NetworkingService()) {
        self.service = service
    }
    
    func fetchUserPostsData(userID: Int) async ->  Result<UserPostsResults, MyError> {
        
        let urlString = "https://gorest.co.in/public-api/users/\(userID)/posts"
        return await service.get(urlString: urlString)

    }
}
