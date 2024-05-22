//
//  HomeManagerMock.swift
//  IOS Assignment
//
//  Created by SORONIATIS Vasilis on 3/4/24.
//

import Foundation

@testable import IOS_Assignment

struct MockHomeManager: HomeManagerType {
    var service: NetworkingServiceType

    init(service: NetworkingServiceType = MockNetworkingService()) {
        self.service = service
    }

    func fetchPageInfo() async -> Result<HomeResponse, MyError> {
        
        return await service.get(urlString: "mock_data1")
    }

    func fetchPosts(for page: Int) async -> Result<HomePostResults, MyError> {

        return await service.get(urlString: "mock_data\(page)")
    }
}
