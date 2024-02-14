//
//  ToDosManager.swift
//  IOS Assignment
//
//  Created by SORONIATIS Vasilis on 8/2/24.
//

import Foundation

struct ToDosManager {
    
    let service: NetworkingService
    
    init(service: NetworkingService = NetworkingService()) {
        self.service = service
    }
    
    func fetchToDosInfo() async ->  Result<ToDosResponse, MyError> {
        
        let urlString = "https://gorest.co.in/public-api/todos"
        return await service.get(urlString: urlString)
    }
    
    func fetchToDos(for page: Int) async ->  Result<ToDosResults, MyError> {
        let urlString = "https://gorest.co.in/public-api/todos?page=\(page)"
        return await service.get(urlString: urlString)
    }
}
