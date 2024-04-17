//
//  HomeManager.swift
//  IOS Assignment
//
//  Created by SORONIATIS Vasilis on 6/2/24.
//

import Foundation

protocol HomeManagerType {
    var service: any NetworkingServiceType { get set }
    
    func fetchPageInfo() async ->  Result<HomeResponse, MyError>
    func fetchPosts(for page: Int) async ->  Result<HomePostResults, MyError>
}

struct HomeManager: HomeManagerType {
    
    var service: any NetworkingServiceType
    
    init(service: NetworkingServiceType) {
        self.service = service
    }
    
    func fetchPageInfo() async ->  Result<HomeResponse, MyError> {
        
        let urlString = "https://gorest.co.in/public-api/posts"
        return await service.get(urlString: urlString)
    }
    
    func fetchPosts(for page: Int) async ->  Result<HomePostResults, MyError> {
        let urlString = "https://gorest.co.in/public-api/posts?page=\(page)"
        return await service.get(urlString: urlString)
    }
}
