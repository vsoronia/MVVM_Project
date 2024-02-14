//
//  UsersDetailViewModel.swift
//  IOS Assignment
//
//  Created by SORONIATIS Vasilis on 6/2/24.
//


import Foundation

class UsersDetailViewModel: ObservableObject {
    
    @Published var state: UsersDetailViewState
    let usersDetailManager: UsersDetailManager
    @Published var deleteSucceded = false
    
    
    init() {
        self.state = .loading
        self.usersDetailManager = UsersDetailManager(service: NetworkingService())
    }
    
    @MainActor
    func fetchData(userID: Int) {
        
        Task{
            
            let usersDetailResults = await usersDetailManager.fetchUserData(userID: userID)
            switch usersDetailResults {
            case .success(let usersResults):
                
                self.state = .userDetails(usersResults.data)
                
            case .failure(let error):
                self.state = .error(error.localizedDescription)
                print(error)
                break
            }
        }
    }
    
    @MainActor
    func deleteUser(userID: Int) async -> Result<Bool, Error> {
        
        let userDelete =  await usersDetailManager.delete(userID: userID)
        switch userDelete {
        case .success:
            return .success(true)
        case .failure(let error):
            return .failure(error)
        }
    }
}

enum UsersDetailViewState {
    case loading
    case userDetails(DetailsData)
    case error(String)
}


