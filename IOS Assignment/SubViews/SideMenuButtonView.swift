//
//  SideMenuButtonView.swift
//  challenge
//
//  Created by SORONIATIS Vasilis on 23/1/24.
//

import SwiftUI

struct SideMenuButtonView: View {
    @Binding var showMenu: Bool
    @Binding var showAnimation: Bool
    var body: some View {
        Button {
            showMenu.toggle()
            showAnimation.toggle()
        } label: {
            
            if showMenu {
                
                ThemeManager.shared.images.hideSideMenuIcon
                    .font(.title)
                    .foregroundColor(.gray)
                
            } else {
                ThemeManager.shared.images.showSideMenuIcon
                    .font(.title)
                    .foregroundColor(.black)
                    .accessibilityLabel("tap to open side menu")
            }
        }
    }
}

