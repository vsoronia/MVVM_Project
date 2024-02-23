//
//  UserCommentsViewModel.swift
//  IOS Assignment
//
//  Created by SORONIATIS Vasilis on 23/2/24.
//

import Foundation

class UserCommentsViewModel: ObservableObject {
    
    @Published var state: UserCommentsViewState
    let userCommentsManager: UserCommentsManager
    
    
    init() {
        self.state = .loading
        self.userCommentsManager = UserCommentsManager(service: NetworkingService())
    }
    
    @MainActor
    func fetchData(userID: Int) async {
        

            let userCommentsResults = await userCommentsManager.fetchUserCommentsData(userID: userID)
        
            switch userCommentsResults {
            case .success(let userCommentsResult):
                if userCommentsResult.data.isEmpty {
                    self.state = .isEmpty
                }
                else{
                    self.state = .userComments(userCommentsResult.data)
                }
                
            case .failure(let error):
                self.state = .error(error.localizedDescription)
                print(error)
                break
            
        }
    }
    
    @MainActor
    func userCommentsReload(userID: Int)  {
        Task{
            self.state = .userComments([])
            await fetchData(userID: userID)
        }
    }
}

enum UserCommentsViewState {
    case loading
    case isEmpty
    case userComments([UserCommentsData])
    case error(String)
}


