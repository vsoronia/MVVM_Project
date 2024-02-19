//
//  UserPostsViewModel.swift
//  IOS Assignment
//
//  Created by SORONIATIS Vasilis on 12/2/24.
//

import Foundation



class UserPostsViewModel: ObservableObject {
    
    @Published var state: UserPostsViewState
    let userPostsManager: UserPostsManager
    
    
    init() {
        self.state = .loading
        self.userPostsManager = UserPostsManager(service: NetworkingService())
    }
    
    @MainActor
    func fetchData(userID: Int) async {
        

            let userPostsResults = await userPostsManager.fetchUserPostsData(userID: userID)
            switch userPostsResults {
            case .success(let userPostsResult):
                self.state = .userPosts(userPostsResult.data)
                
            case .failure(let error):
                self.state = .error(error.localizedDescription)
                print(error)
                break
            
        }
    }
    
    @MainActor
    func userPostsReload(userID: Int)  {
        Task{
            self.state = .userPosts([])
            await fetchData(userID: userID)
        }
    }
}

enum UserPostsViewState {
    case loading
    case userPosts([UserPostsData])
    case error(String)
    case isEmpty
}


