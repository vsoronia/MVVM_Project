//
//  UsersViewModel.swift
//  IOS Assignment
//
//  Created by SORONIATIS Vasilis on 5/2/24.
//

import Foundation

protocol UsersViewModelType: ObservableObject {
    var state: UsersViewState { get set }
    var page: Int { get set }
    func fetchData(page: Int) async
    func fetchMorePosts()
    func usersReload() 
}

class UsersViewModel: UsersViewModelType {
    
    @Published var state: UsersViewState
    var appendedUsers = [UsersData]()
    var page: Int
    var pages: Int = 1
    var currentTotalUsers: Int = 1
    var total: Int = 1
    let userManager: any UserManagerType
    
    init(
        page: Int = 1,
        userManager: UserManagerType
    ) {

        self.state = .loading
        self.page = page
        self.userManager = userManager
    }
    
    @MainActor
    func fetchData(page: Int) async   {
        
        let paginationResults = await userManager.fetchPageInfo()
        switch paginationResults {
        case .success(let response):
            self.pages = response.meta.pagination.pages
            self.total = response.meta.pagination.total
        case .failure(let error):
            print(error)
            break
        }
        
        
        
        let usersResults = await userManager.fetchUsers(for: page)
        switch usersResults {
        case .success(let usersResults):
            appendedUsers.append(contentsOf: usersResults.data)
            currentTotalUsers = appendedUsers.count
            
            self.state = .users(appendedUsers)
            
        case .failure(let error):
            self.state = .error(error.localizedDescription)
            print(error)
            break
        }
    }
    
    @MainActor
    func fetchMorePosts() {
        
        Task {
            
            if page < pages && currentTotalUsers < total {
                
                page += 1
                
                await fetchData(page: page)
                
            }
        }
    }
    @MainActor
    func usersReload()  {
        Task{
            appendedUsers = []
            await fetchData(page: 1)
        }
    }

}

enum UsersViewState {
    case loading
    case users([UsersData])
    case error(String)
}


