//
//  MockToDosManager.swift
//  IOS Assignment
//
//  Created by SORONIATIS Vasilis on 22/4/24.
//

import Foundation

@testable import IOS_Assignment

struct MockToDosManager: ToDosManagerType {
    var service: NetworkingServiceType

    init(service: NetworkingServiceType = MockNetworkingService()) {
        self.service = service
    }

    func fetchToDosInfo() async -> Result<ToDosResponse, MyError> {
        
        return await service.get(urlString: "/Users/vsoronia/Desktop/todos_mock_data1.txt")
    }

    func fetchToDos(for page: Int) async -> Result<ToDosResults, MyError> {

        return await service.get(urlString: "/Users/vsoronia/Desktop/todos_mock_data\(page).txt")
    }
}
