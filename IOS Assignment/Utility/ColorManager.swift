//
//  ColorManager.swift
//  IOS Assignment
//
//  Created by SORONIATIS Vasilis on 14/3/24.
//

import Foundation
import SwiftUI

struct ColorManager {
    let black: Color = .black
    let colorBlackDark: Color = .colorBlackDark
    let colorBlackLight: Color = .colorBlackLight
    let colorBlackMedium: Color = .colorBlackMedium
    let colorExpandSymbol: Color = .colorExpandSymbol
    let colorNavBar: Color = .colorNavBar
    let colorPlaceholderImage: Color = .colorPlaceholder
    let colorSecondaryPlaceholderImage: Color = .colorSecondaryPlaceholder
    let colorSideMenu: Color = .colorSideMenu
    let colorUsers: Color = .colorUsers
    
    //HomeView & Todos View
    let backgroundGradientHomeTodos = LinearGradient(colors: [.colorBlackLight, .colorBlackDark], startPoint: .topLeading, endPoint: .bottomTrailing)
    
    //Users View
    let backgroundGradientUsers = LinearGradient(colors: [.colorBlackMedium, .colorBlackDark], startPoint: .topLeading, endPoint: .bottomTrailing)
    
    //UsersDetail View
    let backgroundGradientUsersDetail = LinearGradient(colors: [.colorBlackLight, .colorBlackMedium], startPoint: .topLeading, endPoint: .bottomTrailing)
    
    //Home List Row View
    let placeHolderImageGradient = LinearGradient(colors:[.colorSecondaryPlaceholder,.colorPlaceholder], startPoint: .topLeading, endPoint: .bottomTrailing)
    
}
