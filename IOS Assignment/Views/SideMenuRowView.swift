//
//  SideMenuViewModel.swift
//  IOS Assignment
//
//  Created by SORONIATIS Vasilis on 23/1/24.
//


import SwiftUI
struct SideMenuRowView: View {
    
    @Binding var selectedSideMenuTab: Int
    @Binding var showMenu: Bool
    @Binding var showAnimation: Bool
    
    var body: some View {
        ForEach(SideMenuRowViewModel.allCases, id: \.self){ row in
            self.row(
                isSelected: selectedSideMenuTab == row.rawValue,
                imageName: row.iconName,
                title: row.title
            ) {
                selectedSideMenuTab = row.rawValue
                showMenu.toggle()
                showAnimation.toggle()
            }
        }
    }
    
    func row(
        isSelected: Bool,
        imageName: String,
        title: String,
        hideDivider: Bool = false,
        action: @escaping ()->()
    ) -> some View{
        Button{
            action()
        } label: {
            VStack(alignment: .leading){
                HStack(spacing: 15){
                    Rectangle()
                        .fill(isSelected ? .colorSideMenu : .white)
                        .frame(width: 5)
                    
                    ZStack{
                        Image(systemName: imageName)
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(isSelected ? .black : .gray)
                            .frame(width: 26, height: 26)
                    }
                    .frame(width: 30, height: 30)
                    Text(title)
                        .font(.system(size: 16, weight: .regular))
                        .foregroundColor(isSelected ? .black : .gray)
                    Spacer()
                }
                
            }
        }
        .frame(height: 50)
    }

}
