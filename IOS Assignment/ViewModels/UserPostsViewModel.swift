//
//  UserPostsViewModel.swift
//  IOS Assignment
//
//  Created by SORONIATIS Vasilis on 12/2/24.
//

import Foundation

protocol UserPostsViewModelType: ObservableObject {
    var state: UserPostsViewState { get set }
    func fetchData(userID: Int) async
    func userPostsReload(userID: Int)
}

class UserPostsViewModel: UserPostsViewModelType {
    
    @Published var state: UserPostsViewState
    let userPostsManager: any UserPostsManagerType
    
    
    init(userPostsManager: UserPostsManagerType) {
        self.state = .loading
        self.userPostsManager = userPostsManager
    }
    
    @MainActor
    func fetchData(userID: Int) async {
        

            let userPostsResults = await userPostsManager.fetchUserPostsData(userID: userID)
        
            switch userPostsResults {
            case .success(let userPostsResult):
                if userPostsResult.data.isEmpty {
                    self.state = .isEmpty
                }
                else{
                    self.state = .userPosts(userPostsResult.data)
                }
                
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
    case isEmpty
    case userPosts([UserPostsData])
    case error(String)
}


