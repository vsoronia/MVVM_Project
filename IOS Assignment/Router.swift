//
//  Router.swift
//  IOS Assignment
//
//  Created by SORONIATIS Vasilis on 13/2/24.
//


import SwiftUI

protocol RouterType {
    func navigate(to destination: Destination)
    func navigateBack()
    func navigateToRoot()
}

final class Router: ObservableObject, RouterType {
    
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

enum Destination: Codable, Hashable {
    case userDetails(id: Int)
    case userPosts(id: Int)
    case userComments(id: Int)
    case userTodos(id: Int)
}
