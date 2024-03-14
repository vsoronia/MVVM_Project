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
            List {
                Section(
                    header: Text(String.aboutTheApp),
                    footer: HStack {
                        Spacer()
                        Text(String.copyrightMessage)
                        Spacer()
                    }
                    .padding(20)
                ) {
                    AboutUsListRowView(rowLabel: .application,
                                       rowIcon: "apps.iphone",
                                       rowContent: .todosApp,
                                       rowTintColor: .blue)

                    AboutUsListRowView(rowLabel: .compatibility,
                                       rowIcon: "info.circle",
                                       rowContent: .miniOSVersion,
                                       rowTintColor: .red)

                    AboutUsListRowView(rowLabel: .technology,
                                       rowIcon: "swift",
                                       rowContent: .swiftUI,
                                       rowTintColor: .orange)

                    AboutUsListRowView(rowLabel: .version,
                                       rowIcon: "gear",
                                       rowContent: .appVersion,
                                       rowTintColor: .purple)

                    AboutUsListRowView(rowLabel: .developer,
                                       rowIcon: "ellipsis.curlybraces",
                                       rowContent: .developerName,
                                       rowTintColor: .mint)

                    AboutUsListRowView(rowLabel: .designer,
                                       rowIcon: "paintpalette",
                                       rowContent: .designerName,
                                       rowTintColor: .pink)

                    AboutUsListRowView(rowLabel: .facebook,
                                       rowIcon: "f.square",
                                       rowTintColor: .indigo,
                                       rowLinkLabel: .todos,
                                       rowLinkDestination: "https://facebook.com")

                    AboutUsListRowView(rowLabel: .instagram,
                                       rowIcon: "camera.metering.center.weighted",
                                       rowTintColor: .purple,
                                       rowLinkLabel: .todos,
                                       rowLinkDestination: "https://instagram.com")

                    AboutUsListRowView(rowLabel: .contactAndSupport,
                                       rowIcon: "questionmark.circle",
                                       rowContent: .contactEmail,
                                       rowTintColor: .blue)
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
