//
//  UserToDosViewModel.swift
//  IOS Assignment
//
//  Created by SORONIATIS Vasilis on 20/2/24.
//

import Foundation

protocol UserToDosViewModelType: ObservableObject {
    var state: UserToDosViewState { get set }
    func fetchData(userID: Int) async
    func userToDosReload(userID: Int)
}

class UserToDosViewModel: UserToDosViewModelType {
    
    @Published var state: UserToDosViewState
    let userToDosManager: any UserToDosManagerType
    
    
    init(userToDosManager: UserToDosManagerType = UserToDosManager(service: NetworkingService())) {
        self.state = .loading
        self.userToDosManager = userToDosManager
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


