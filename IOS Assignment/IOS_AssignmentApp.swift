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
  
    private let graphController = GraphController.shared
  
    @State private var isActive = false
    var body: some Scene {
      WindowGroup {
          if isActive {
            MainTabView(
              homeViewModel: graphController.resolve(HomeViewModel.self),
              usersViewModel: graphController.resolve(UsersViewModel.self),
              toDosViewModel: graphController.resolve(ToDosViewModel.self)
            )
          } else {
              Text("iOS Assignment")
              .onAppear {
                  DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                      self.isActive = true
                  }
              }
          }
      }
    }
}
