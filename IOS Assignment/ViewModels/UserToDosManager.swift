//
//  UserToDosManager.swift
//  IOS Assignment
//
//  Created by SORONIATIS Vasilis on 20/2/24.
//

import Foundation

struct UserToDosManager {
    
    let service: NetworkingService
    
    init(service: NetworkingService = NetworkingService()) {
        self.service = service
    }
    
    func fetchUserToDosData(userID: Int) async ->  Result<ToDosResults, MyError> {
        
        let urlString = "https://gorest.co.in/public-api/users/\(userID)/todos"
        return await service.get(urlString: urlString)

    }
}
