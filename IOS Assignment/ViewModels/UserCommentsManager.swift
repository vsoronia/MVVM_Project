//
//  UserCommentsManager.swift
//  IOS Assignment
//
//  Created by SORONIATIS Vasilis on 23/2/24.
//

import Foundation

struct UserCommentsManager {
    
    let service: NetworkingService
    
    init(service: NetworkingService = NetworkingService()) {
        self.service = service
    }
    
    func fetchUserCommentsData(userID: Int) async ->  Result<UserCommentsResults, MyError> {
        
        let urlString = "https://gorest.co.in/public-api/posts/\(userID)/comments"
        return await service.get(urlString: urlString)
        
    }
}
