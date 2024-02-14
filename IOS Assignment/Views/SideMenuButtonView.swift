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
                
                Image(systemName: "text.justify")
                    .font(.title)
                    .foregroundColor(.gray)
                
            } else {
                Image(systemName: "text.justify.left")
                    .font(.title)
                    .foregroundColor(.black)
            }
        }
    }
}

