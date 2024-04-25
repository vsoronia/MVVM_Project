//
//  MockUserDetailsManager.swift
//  IOS Assignment
//
//  Created by SORONIATIS Vasilis on 22/4/24.
//

import Foundation

@testable import IOS_Assignment

struct MockUsersDetailManager: UsersDetailManagerType {
    
    var service: NetworkingServiceType

    init(service: NetworkingServiceType = MockNetworkingService()) {
        self.service = service
    }
    
    func fetchUserData(userID: Int) async -> Result<UsersDetailModel, MyError> {
        return await service.get(urlString: "/Users/vsoronia/Desktop/user_details_mock_data\(userID).txt")
    }
    
    func delete(userID: Int) async -> Result<String, MyError> {
        return .success("")
    }
}
