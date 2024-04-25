//
//  MockAssembler.swift
//  IOS Assignment
//
//  Created by SORONIATIS Vasilis on 23/4/24.
//

import Swinject

class MockAssembly: Assembly {
    func assemble(container: Container) {
        container.register(NetworkingServiceType.self) { _ in MockNetworkingService() }
        
        container.register(HomeManagerType.self) { r in MockHomeManager(service: r.resolve(NetworkingServiceType.self)!) }
        container.register(HomeViewModel.self) { r in HomeViewModel(homeManager: r.resolve(HomeManagerType.self)!)}
        
        container.register(UserManagerType.self) { r in MockUsersManager(service: r.resolve(NetworkingServiceType.self)!) }
        container.register(UsersViewModel.self) { r in UsersViewModel(userManager: r.resolve(UserManagerType.self)!)}
    }
}

public let mockAssembler = Assembler([MockAssembly()])
