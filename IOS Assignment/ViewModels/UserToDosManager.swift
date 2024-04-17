//
//  UserToDosManager.swift
//  IOS Assignment
//
//  Created by SORONIATIS Vasilis on 20/2/24.
//

import Foundation

protocol UserToDosManagerType {
    func fetchUserToDosData(userID: Int) async ->  Result<ToDosResults, MyError>
}

struct UserToDosManager: UserToDosManagerType {
    
    let service: NetworkingServiceType
    
    init(service: NetworkingServiceType) {
        self.service = service
    }
    
    func fetchUserToDosData(userID: Int) async ->  Result<ToDosResults, MyError> {
        
        let urlString = "https://gorest.co.in/public-api/users/\(userID)/todos"
        return await service.get(urlString: urlString)

    }
}
