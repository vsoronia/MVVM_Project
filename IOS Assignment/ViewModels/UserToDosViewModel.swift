//
//  UserToDosViewModel.swift
//  IOS Assignment
//
//  Created by SORONIATIS Vasilis on 20/2/24.
//

import Foundation


class UserToDosViewModel: ObservableObject {
    
    @Published var state: UserToDosViewState
    let userToDosManager: UserToDosManager
    
    
    init() {
        self.state = .loading
        self.userToDosManager = UserToDosManager(service: NetworkingService())
    }
    
    @MainActor
    func fetchData(userID: Int) async {
        

            let userToDosResults = await userToDosManager.fetchUserToDosData(userID: userID)
        
            switch userToDosResults {
            case .success(let userToDosResult):
                if userToDosResult.data.isEmpty {
                    self.state = .isEmpty
                }
                else{
                    self.state = .userToDos(userToDosResult.data)
                }
                
            case .failure(let error):
                self.state = .error(error.localizedDescription)
                print(error)
                break
            
        }
    }
    
    @MainActor
    func userToDosReload(userID: Int)  {
        Task{
            self.state = .userToDos([])
            await fetchData(userID: userID)
        }
    }
}

enum UserToDosViewState {
    case loading
    case isEmpty
    case userToDos([ToDosData])
    case error(String)
}


