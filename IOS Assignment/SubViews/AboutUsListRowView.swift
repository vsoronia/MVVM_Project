//
//  AboutUsListRowView.swift
//  IOS Assignment
//
//  Created by SORONIATIS Vasilis on 7/2/24.
//

import SwiftUI

struct AboutUsListRowView: View {
    
    @State var rowLabel: String
    @State var rowIcon: Image
    @State var rowContent: String? = nil
    @State var rowTintColor: Color
    @State var rowLinkLabel: String? = nil
    @State var rowLinkDestination: String? = nil
    
    var body: some View {
        
        LabeledContent {

            if rowContent != nil {
                Text(rowContent!)
                    .foregroundColor(.primary)
                    .fontWeight(.bold)
            } else if (rowLinkLabel != nil && rowLinkDestination != nil) {
                Link(rowLinkLabel!, destination: URL(string: rowLinkDestination!)!)
                    .foregroundColor(.pink)
                    .fontWeight(.bold)
            } else {
                EmptyView()
            }
        } label: {

            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: 30, height: 30)
                        .foregroundColor(rowTintColor)
                    rowIcon
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                }
                
                Text(rowLabel)
            }
        }
    }
}



//#Preview {
//    AboutUsListRowView(rowLabel: "Contact & Support", rowIcon: "questionmark.circle", rowContent: "vsoro@example.com", rowTintColor: .blue)
//}
