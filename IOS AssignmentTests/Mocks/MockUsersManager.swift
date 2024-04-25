//
//  MockUsersManager.swift
//  IOS Assignment
//
//  Created by SORONIATIS Vasilis on 22/4/24.
//

import Foundation

struct MockUsersManager: UserManagerType {
    var service: NetworkingServiceType

    init(service: NetworkingServiceType = MockNetworkingService()) {
        self.service = service
    }

    func fetchPageInfo() async -> Result<UsersResponse, MyError> {
        
        return await service.get(urlString: "/Users/vsoronia/Desktop/users_mock_data1.txt")
    }

    func fetchUsers(for page: Int) async -> Result<UsersResults, MyError> {

        return await service.get(urlString: "/Users/vsoronia/Desktop/users_mock_data\(page).txt")
    }
}
