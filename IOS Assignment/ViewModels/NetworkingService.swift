//
//  NetworkingService.swift
//  IOS Assignment
//
//  Created by SORONIATIS Vasilis on 24/1/24.
//

import SwiftUI
import Alamofire

class NetworkingService {
    
    func get<T: Codable>(urlString: String) async -> Result<T, MyError> {
        
        guard let url = URL(string: urlString) else {
            return .failure(.wrong("Invalid url"))
        }
        
        return await AF.request(url)
            .serializingDecodable(T.self)
            .result
            .mapError { .afError($0) }
    }
    
    func delete(urlString: String) async -> Result<String, MyError> {
        
        guard let url = URL(string: urlString) else {
            return .failure(.wrong("Invalid url"))
        }
        
        return await AF.request(url, method: .delete, headers: .init([.init(name: "Authorization", value: "Bearer 467023bee0ee5846310c1bd1f75de70052a92cae617aea1190dd296a17bcb728")]))
            .serializingString()
            .result
            .mapError { .afError($0) }
    }
}

enum MyError: LocalizedError {
    case wrong(String)
    case afError(AFError)
    
    var errorDescription: String? {
        switch self {
        case .wrong(let reason):
            return "MyError: \(reason)"
        case .afError(let error):
            return "MyError: AFError: \(error.localizedDescription)"
        }
    }
}
