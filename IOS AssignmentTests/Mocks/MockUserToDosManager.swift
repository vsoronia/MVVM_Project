//
//  MockUserToDosManager.swift
//  IOS AssignmentTests
//
//  Created by SORONIATIS Vasilis on 25/4/24.
//

import Foundation

@testable import IOS_Assignment

struct MockUserToDosManager: UserToDosManagerType {
    var service: NetworkingServiceType

    init(service: NetworkingServiceType = MockNetworkingService()) {
        self.service = service
    }

    func fetchUserToDosData(userID: Int) async -> Result<ToDosResults, MyError> {

        return await service.get(urlString: "/Users/vsoronia/Desktop/mock.txt")
    }
}
