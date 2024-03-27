//
//  SideMenuRowType.swift
//  IOS Assignment
//
//  Created by SORONIATIS Vasilis on 18/1/24.
//

import SwiftUI

enum SideMenuRowViewModel: Int, CaseIterable{
    case home = 0
    case users = 1
    case todos = 2
    case about = 3
    
    var title: String{
        switch self {
        case .home:
            return "Home"
        case .users:
            return "Users"
        case .todos:
            return "TODOs"
        case .about:
            return "About Us"
        }
    }
    
    var icon: Image{
        switch self {
        case .home:
            return ThemeManager.shared.images.sideMenuHomeIcon
        case .users:
            return ThemeManager.shared.images.sideMenuUsersIcon
        case .todos:
            return ThemeManager.shared.images.sideMenuTodosIcon
        case .about:
            return ThemeManager.shared.images.sideMenuAboutusIcon
        }
    }
}


