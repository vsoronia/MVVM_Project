//
//  HomeManagerMock.swift
//  IOS Assignment
//
//  Created by SORONIATIS Vasilis on 3/4/24.
//

import Foundation


struct MockHomeManager: HomeManagerType {
    var service: NetworkingServiceType

    init(service: NetworkingServiceType = MockNetworkingService()) {
        self.service = service
    }

    func fetchPageInfo() async -> Result<HomeResponse, MyError> {
        
        return await service.get(urlString: "/Users/vsoronia/Desktop/mock_data1.txt")
    }

    func fetchPosts(for page: Int) async -> Result<HomePostResults, MyError> {

        return await service.get(urlString: "/Users/vsoronia/Desktop/mock_data\(page).txt")
    }
}
