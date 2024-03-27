//
//  NetworkingService.swift
//  IOS Assignment
//
//  Created by SORONIATIS Vasilis on 24/1/24.
//

import SwiftUI
import Alamofire

protocol NetworkServiceType {
    func get<T: Codable>(urlString: String) async -> Result<T, MyError>
    func delete(urlString: String) async -> Result<String, MyError>
}


class NetworkingService: NetworkServiceType {
    
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
        
        return await AF.request(url, method: .delete, headers: .init([.init(name: .authName, value: .token)]))
            .serializingString()
            .result
            .mapError { .afError($0) }
    }
}

//Errors file
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
