//
//  MainTabView.swift
//  IOS Assignment
//
//  Created by SORONIATIS Vasilis on 18/1/24.
//

import SwiftUI

struct MainTabView: View {
    
    @State var showMenu: Bool = false
    @State var selectedSideMenuTab: Int = 0
    @State var showAnimation: Bool = false
    @State var homeLoadedFirstTime: Bool = true
    @State var usersLoadedFirstTime: Bool = true
    @State var toDosLoadedFirstTime: Bool = true
    
    let homeViewModel: HomeViewModel = assembler.resolver.resolve(HomeViewModel.self)!
    let usersViewModel: UsersViewModel = assembler.resolver.resolve(UsersViewModel.self)!
    let toDosViewModel: ToDosViewModel = assembler.resolver.resolve(ToDosViewModel.self)!
    
    var body: some View {
        
        
        ZStack{
           Group {
            switch selectedSideMenuTab {
            case 0:
                HomeView(
                    showMenu: $showMenu,
                    showAnimation: $showAnimation,
                    selectedSideMenuTab: $selectedSideMenuTab,
                    viewModel: homeViewModel,
                    loadedFirstTime: $homeLoadedFirstTime
                )
                
            case 1:
                
                UsersView(
                    showMenu: $showMenu,
                    showAnimation: $showAnimation,
                    selectedSideMenuTab: $selectedSideMenuTab,
                    viewModel: usersViewModel,
                    loadedFirstTime: $usersLoadedFirstTime
                )
                
            case 2:
                ToDosView(
                    showMenu: $showMenu,
                    showAnimation: $showAnimation,
                    selectedSideMenuTab: $selectedSideMenuTab,
                    viewModel: toDosViewModel,
                    loadedFirstTime: $toDosLoadedFirstTime
                )
                
            case 3:
                AboutUsView(
                    showMenu: $showMenu,
                    showAnimation: $showAnimation,
                    selectedSideMenuTab: $selectedSideMenuTab
                )
                
            default: EmptyView()
            }
        }
                    .accessibilityHidden(showMenu)
                
                SideMenuView(selectedSideMenuTab: $selectedSideMenuTab, showMenu: $showMenu, showAnimation: $showAnimation)
                
            }
    }
}



