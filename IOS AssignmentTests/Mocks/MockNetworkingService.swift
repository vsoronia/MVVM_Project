//
//  NetworkingServiceMock.swift
//  IOS Assignment
//
//  Created by SORONIATIS Vasilis on 3/4/24.
//

import Foundation

class MockNetworkingService: NetworkingServiceType {
    
    func get<T: Codable>(urlString: String) async -> Result<T, MyError> {

        if let data = try? Data(contentsOf: URL(fileURLWithPath: urlString)) {
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                return .success(decodedData)
            } catch {
                return .failure(.wrong("Failed to decode mock data"))
            }
        } else {
            return .failure(.wrong("Failed to load mock data"))
        }
    }
    
    func delete(urlString: String) async -> Result<String, MyError> {
        return .success("Deleted successfully")
    }
}
