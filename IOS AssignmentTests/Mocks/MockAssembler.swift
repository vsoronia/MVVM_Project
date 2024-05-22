//
//  MockAssembler.swift
//  IOS Assignment
//
//  Created by SORONIATIS Vasilis on 23/4/24.
//

import Swinject

@testable import IOS_Assignment

class MockAssembly: Assembly {
    func assemble(container: Container) {
        container.register(NetworkingServiceType.self) { _ in MockNetworkingService() }
        
        container.register(HomeManagerType.self) { r in MockHomeManager(service: r.resolve(NetworkingServiceType.self)!) }
        container.register(HomeViewModel.self) { r in HomeViewModel(homeManager: r.resolve(HomeManagerType.self)!)}
        
        container.register(UserManagerType.self) { r in MockUsersManager(service: r.resolve(NetworkingServiceType.self)!)}
        container.register(UsersViewModel.self) { r in UsersViewModel(userManager: r.resolve(UserManagerType.self)!)}
      
      container.register(ToDosManagerType.self) { r in MockToDosManager(service: r.resolve(NetworkingServiceType.self)!) }
      container.register(ToDosViewModel.self) { r in ToDosViewModel(toDosManager: r.resolve(ToDosManagerType.self)!)}
      
      container.register(UsersDetailManagerType.self) { r in MockUsersDetailManager(service: r.resolve(NetworkingServiceType.self)!) }
      container.register(UsersDetailViewModel.self) { r in UsersDetailViewModel(usersDetailManager: r.resolve(UsersDetailManagerType.self)!) }
      
      container.register(UserPostsManagerType.self) { r in MockUserPostsManager(service: r.resolve(NetworkingServiceType.self)!) }
      container.register(UserPostsViewModel.self) { r in UserPostsViewModel(userPostsManager: r.resolve(UserPostsManagerType.self)!) }
      
      container.register(UserToDosManagerType.self) { r in MockUserToDosManager(service: r.resolve(NetworkingServiceType.self)!) }
      container.register(UserToDosViewModel.self) { r in UserToDosViewModel(userToDosManager: r.resolve(UserToDosManagerType.self)!) }
      
      container.register(UserCommentsManagerType.self) { r in MockUserCommentsManager(service: r.resolve(NetworkingServiceType.self)!) }
      container.register(UserCommentsViewModel.self) { r in UserCommentsViewModel(userCommentsManager: r.resolve(UserCommentsManagerType.self)!) }
    }
}

