//
//  NetworkingServiceMock.swift
//  IOS Assignment
//
//  Created by SORONIATIS Vasilis on 3/4/24.
//

import Foundation

@testable import IOS_Assignment

class MockNetworkingService: NetworkingServiceType {

    func get<T: Codable>(urlString: String) async -> Result<T, MyError> {
        guard let url = Bundle(for: type(of: self)).url(forResource: urlString, withExtension: "txt") else {
            return .failure(.wrong("Failed to load mock data"))
        }

        do {
            let data = try Data(contentsOf: url)
            let decodedData = try JSONDecoder().decode(T.self, from: data)
            return .success(decodedData)
        } catch {
            return .failure(.wrong("Failed to decode mock data"))
        }
    }

    func delete(urlString: String) async -> Result<String, MyError> {
        return .success("Deleted successfully")
    }
}

