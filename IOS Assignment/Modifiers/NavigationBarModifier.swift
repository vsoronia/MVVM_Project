//
//  NavigationBarModifier.swift
//  IOS Assignment
//
//  Created by SORONIATIS Vasilis on 24/1/24.
//

import SwiftUI

struct NavigationBarModifier: ViewModifier {
    @Binding var showMenu: Bool
    @Binding var showAnimation: Bool
    func body(content: Content) -> some View {
        content
            .navigationBarItems(
                leading: SideMenuButtonView(
                    showMenu: $showMenu,
                    showAnimation: $showAnimation
                )
                .padding(.horizontal, 10))
            .toolbarBackground(Color.colorNavBar, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            

    }
}
