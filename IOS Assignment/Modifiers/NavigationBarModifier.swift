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
    @State var isSignupPresented = false
    func body(content: Content) -> some View {
        content
            .navigationBarItems(
                leading: SideMenuButtonView(
                    showMenu: $showMenu,
                    showAnimation: $showAnimation
                )
                .padding(.horizontal, 10))
            .navigationBarItems(trailing:
                                    Button(action: {
                isSignupPresented.toggle()
            }) {
                Text("Signup")
            }
                .padding())
            .sheet(isPresented: $isSignupPresented) {
                SignUpView()}
            .toolbarBackground(Color.colorNavBar, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        
        
    }
}
