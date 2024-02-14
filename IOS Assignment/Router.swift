//
//  Router.swift
//  IOS Assignment
//
//  Created by SORONIATIS Vasilis on 13/2/24.
//


import SwiftUI

class Router: ObservableObject {
    enum Destination: Codable, Hashable {
        case userDetails(id: Int)
        case userPosts(id: Int)
        case userComments
        case userTodos
    }
    
    @Published var navPath = NavigationPath()
    
    func navigate(to destination: Destination) {
        navPath.append(destination)
    }
    func navigateBack() {
        navPath.removeLast()
    }
    
    func navigateToRoot() {
        navPath.removeLast(navPath.count)
    }
}
