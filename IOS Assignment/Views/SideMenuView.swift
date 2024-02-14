//
//  SideMenu.swift
//  IOS Assignment
//
//  Created by SORONIATIS Vasilis on 17/1/24.
//

import SwiftUI

struct SideMenuView: View {
    
    @Binding var selectedSideMenuTab: Int
    @Binding var showMenu: Bool
    @Binding var showAnimation: Bool
    
    // MARK: - Content
    
    var body: some View {
        ZStack{
            
                Color.black.opacity(showMenu ? 0.45 : 0)
                .animation(.linear(duration: 0.4), value: showAnimation)
                .ignoresSafeArea()
                .onTapGesture {
                    showMenu.toggle()
                    showAnimation.toggle()
                }
            HStack {
                ZStack {
                    
                    Rectangle()
                        .fill(.white)
                        .frame(width: 270)
                        .shadow(color: .black.opacity(0.8), radius: 5, x: 8)
                        .ignoresSafeArea()
                    
                    VStack {
                        
                        SideMenuRowView(selectedSideMenuTab: $selectedSideMenuTab, showMenu: $showMenu, showAnimation: $showAnimation)
                        Spacer()
                    }
                    .frame(width: 270)
                    .padding(10)
                    .background(Color.white)
                    .edgesIgnoringSafeArea(.bottom)
                }
                Spacer()
            }
            .offset(x: showMenu ? 0 : -UIScreen.main.bounds.width)
            .animation(.easeInOut(duration: 0.4), value: showAnimation)
        }
    }
}

struct SideMenu_Previews: PreviewProvider {
    @State static var showMenu = false
    @State static var selectedSideMenuTab:Int = 0
    
    static var previews: some View {
        
        ZStack {
            Color.black
            SideMenuView(selectedSideMenuTab: $selectedSideMenuTab, showMenu: $showMenu, showAnimation: .constant(true))
        }
        
    }
}
