//
//  Assembler.swift
//  IOS Assignment
//
//  Created by SORONIATIS Vasilis on 15/4/24.
//

import Swinject

class ServiceAssembly: Assembly {
    func assemble(container: Container) {
        container.register(NetworkingServiceType.self) { _ in NetworkingService() }
        
        container.register(HomeManagerType.self) { r in HomeManager(service: r.resolve(NetworkingServiceType.self)!) }
        container.register(HomeViewModel.self) { r in HomeViewModel(homeManager: r.resolve(HomeManagerType.self)!)}
        
        container.register(UserManagerType.self) { r in UserManager(service: r.resolve(NetworkingServiceType.self)!) }
        container.register(UsersViewModel.self) { r in UsersViewModel(userManager: r.resolve(UserManagerType.self)!)}
        
        container.register(ToDosManagerType.self) { r in ToDosManager(service: r.resolve(NetworkingServiceType.self)!) }
        container.register(ToDosViewModel.self) { r in ToDosViewModel(toDosManager: r.resolve(ToDosManagerType.self)!)}
        
        container.register(UsersDetailManagerType.self) { r in UsersDetailManager(service: r.resolve(NetworkingServiceType.self)!) }
        container.register(UsersDetailViewModel.self) { r in UsersDetailViewModel(usersDetailManager: r.resolve(UsersDetailManagerType.self)!) }
        
        container.register(UserPostsManagerType.self) { r in UserPostsManager(service: r.resolve(NetworkingServiceType.self)!) }
        container.register(UserPostsViewModel.self) { r in UserPostsViewModel(userPostsManager: r.resolve(UserPostsManagerType.self)!) }
        
        container.register(UserToDosManagerType.self) { r in UserToDosManager(service: r.resolve(NetworkingServiceType.self)!) }
        container.register(UserToDosViewModel.self) { r in UserToDosViewModel(userToDosManager: r.resolve(UserToDosManagerType.self)!) }
        
        container.register(UserCommentsManagerType.self) { r in UserCommentsManager(service: r.resolve(NetworkingServiceType.self)!) }
        container.register(UserCommentsViewModel.self) { r in UserCommentsViewModel(userCommentsManager: r.resolve(UserCommentsManagerType.self)!) }
    }
}
