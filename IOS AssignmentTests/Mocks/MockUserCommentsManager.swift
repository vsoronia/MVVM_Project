//
//  MockUserCommentsManager.swift
//  IOS AssignmentTests
//
//  Created by SORONIATIS Vasilis on 25/4/24.
//

import Foundation

@testable import IOS_Assignment

struct MockUserCommentsManager: UserCommentsManagerType {
    var service: NetworkingServiceType

    init(service: NetworkingServiceType = MockNetworkingService()) {
        self.service = service
    }

    func fetchUserCommentsData(userID: Int) async -> Result<UserCommentsResults, MyError> {

        return await service.get(urlString: "/Users/vsoronia/Desktop/mock.txt")
    }
}
