//
//  IOS_AssignmentApp.swift
//  IOS Assignment
//
//  Created by SORONIATIS Vasilis on 16/1/24.
//

import SwiftUI

@main
struct IOS_AssignmentApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    init() {
        print("IOS_AssignmentApp")
    }
    
    var body: some Scene {
        WindowGroup {
            
            MainTabView(
                homeViewModel: GraphController.shared.assembler.resolver.resolve(HomeViewModel.self)!,
                usersViewModel: GraphController.shared.assembler.resolver.resolve(UsersViewModel.self)!,
                toDosViewModel: GraphController.shared.assembler.resolver.resolve(ToDosViewModel.self)!
            )
        }
    }
}
