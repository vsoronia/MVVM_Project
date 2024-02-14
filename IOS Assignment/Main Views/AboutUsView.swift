//
//  AboutUsView.swift
//  IOS Assignment
//
//  Created by SORONIATIS Vasilis on 23/1/24.
//

import SwiftUI


struct AboutUsView: View {
    @Binding var showMenu: Bool
    @Binding var showAnimation: Bool
    @Binding var selectedSideMenuTab: Int
    
    var body: some View {
        NavigationStack {
            List{
                
                Section(
                    header: Text("ABOUT THE APP"),
                    footer: HStack {
                        Spacer()
                        Text("Copyright © All right reserved.")
                        Spacer()
                    }
                        .padding(20)
                ) {
                    AboutUsListRowView(rowLabel: "Application", rowIcon: "apps.iphone", rowContent: "TODOs App", rowTintColor: .blue)
                    
                    AboutUsListRowView(rowLabel: "Compatibility", rowIcon: "info.circle", rowContent: "min iOS 16", rowTintColor: .red)
                    
                    AboutUsListRowView(rowLabel: "Technology", rowIcon: "swift", rowContent: "SwiftUI", rowTintColor: .orange)
                    
                    AboutUsListRowView(rowLabel: "Version", rowIcon: "gear", rowContent: "1.0", rowTintColor: .purple)
                    
                    AboutUsListRowView(rowLabel: "Developer", rowIcon: "ellipsis.curlybraces", rowContent: "Vsoro", rowTintColor: .mint)
                    
                    AboutUsListRowView(rowLabel: "Designer", rowIcon: "paintpalette", rowContent: "Vsoro", rowTintColor: .pink)
                    
                    AboutUsListRowView(rowLabel: "Facebook", rowIcon: "f.square", rowTintColor: .indigo, rowLinkLabel: "TODOs", rowLinkDestination: "https://facebook.com")
                    
                    AboutUsListRowView(rowLabel: "Instagram", rowIcon: "camera.metering.center.weighted", rowTintColor: .purple, rowLinkLabel: "_TODOs", rowLinkDestination: "https://instagram.com")
                    
                    AboutUsListRowView(rowLabel: "Contact & Support", rowIcon: "questionmark.circle", rowContent: "vsoro@example.com", rowTintColor: .blue)
                    
                }
            }
            .navigationBarTitle(SideMenuRowViewModel.about.title, displayMode: .inline)
            .modifier(NavigationBarModifier(showMenu: $showMenu, showAnimation: $showAnimation))
        }
    }
}
struct AboutUsView_Previews: PreviewProvider {
    @State static var showMenu = false
    @State static var selectedSideMenuTab:Int = 0
    @State static var showAnimation = true
    
    static var previews: some View {
        AboutUsView(showMenu: $showMenu, showAnimation: $showAnimation, selectedSideMenuTab: $selectedSideMenuTab)
        
    }
}
