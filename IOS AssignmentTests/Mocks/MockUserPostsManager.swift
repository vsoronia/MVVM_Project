//
//  MockUserPostsManager.swift
//  IOS AssignmentTests
//
//  Created by SORONIATIS Vasilis on 25/4/24.
//

import Foundation

@testable import IOS_Assignment

struct MockUserPostsManager: UserPostsManagerType {
    var service: NetworkingServiceType

    init(service: NetworkingServiceType = MockNetworkingService()) {
        self.service = service
    }

    func fetchUserPostsData(userID: Int) async -> Result<UserPostsResults, MyError> {

        return await service.get(urlString: "/Users/vsoronia/Desktop/mock.txt")
    }
}
