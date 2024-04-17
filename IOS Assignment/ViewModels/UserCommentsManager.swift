//
//  UserCommentsManager.swift
//  IOS Assignment
//
//  Created by SORONIATIS Vasilis on 23/2/24.
//

import Foundation

protocol UserCommentsManagerType {
    func fetchUserCommentsData(userID: Int) async ->  Result<UserCommentsResults, MyError>
}

struct UserCommentsManager: UserCommentsManagerType {
    
    let service: NetworkingServiceType
    
    init(service: NetworkingServiceType) {
        self.service = service
    }
    
    func fetchUserCommentsData(userID: Int) async ->  Result<UserCommentsResults, MyError> {
        
        let urlString = "https://gorest.co.in/public-api/posts/\(userID)/comments"
        return await service.get(urlString: urlString)
        
    }
}
