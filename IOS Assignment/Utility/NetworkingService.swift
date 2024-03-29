//
//  NetworkingService.swift
//  IOS Assignment
//
//  Created by SORONIATIS Vasilis on 24/1/24.
//

import SwiftUI
import Alamofire

protocol NetworkingServiceType {
    func get<T: Codable>(urlString: String) async -> Result<T, MyError>
    func delete(urlString: String) async -> Result<String, MyError>
}


class NetworkingService: NetworkingServiceType {
    
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
