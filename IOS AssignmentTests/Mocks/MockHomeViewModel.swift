//
//  MockHomeViewModel.swift
//  IOS AssignmentTests
//
//  Created by SORONIATIS Vasilis on 5/4/24.
//

import Foundation
@testable import IOS_Assignment

class MockHomeViewModel: HomeViewModelType {
    
    var homeManager: any HomeManagerType
    var appendedPosts = [HomePostData]()
    var pages: Int = 0
    var currentTotalPosts: Int = 0
    
    var state: HomeViewState = .loading
    var page: Int = 0
    var total: Int = 0
    
    init(homeManager: HomeManagerType) {
        self.homeManager = homeManager
    }
    
    func fetchData(page: Int) async {
        _ = await self.homeManager.fetchPosts(for: 0)
        state = .posts([
            .init(id: 1, user_id: 1, title: "a", body: ""),
            .init(id: 2, user_id: 2, title: "b", body: ""),
            .init(id: 3, user_id: 3, title: "c", body: ""),
            .init(id: 4, user_id: 4, title: "d", body: ""),
            .init(id: 5, user_id: 5, title: "e", body: ""),
            .init(id: 6, user_id: 6, title: "f", body: "")
        ])
    }
    
    func fetchMorePosts()  {
        Task{
            if page < pages && currentTotalPosts < total {
                
                page += 1
                
                await fetchData(page: page)
            }
        }
    }
    func postsReload() {
        Task{
            appendedPosts = []
            await fetchData(page: 1)
        }
    }
}
