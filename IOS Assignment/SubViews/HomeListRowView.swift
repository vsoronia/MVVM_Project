//
//  homeListRowView.swift
//  IOS Assignment
//
//  Created by SORONIATIS Vasilis on 30/1/24.
//

import SwiftUI

struct HomeListRowView: View {
    
    
    let user: String
    let title: String
    let bodyText: String
    let showFullPost: Bool
    
    init(
        user: String,
        title: String,
        bodyText: String,
        showFullPost: Bool
        
    )
    {
        self.user = user
        self.title = title
        self.bodyText = bodyText
        self.showFullPost = showFullPost
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .center) {
                Text(user)
                    .font(.headline)
                    .foregroundColor(.primary)
                
                ThemeManager.shared.images.placeHolderUserImageIcon
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .foregroundStyle(ThemeManager.shared.colors.placeHolderImageGradient)
                    .clipShape(Circle())
                    .accessibilityHidden(true)

                Spacer()
                
                if showFullPost{
                    ThemeManager.shared.images.expandedIcon
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 26, height: 26)
                        .foregroundColor(.colorExpandSymbol)
                        .padding(.bottom, 5)
                        .accessibilityHidden(true)

                }
                
                else {
                    
                    ThemeManager.shared.images.expandIcon
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 22, height: 22)
                        .foregroundColor(.colorExpandSymbol)
                        .padding(.bottom, 5)
                        .accessibilityHidden(true)

                }
                
            }
            
            Spacer()
            
            VStack(alignment: .center) {
                
                
                Text(title)
                    .font(.title3)
                    .foregroundColor(.primary)
                    .padding(3)

                ScrollView(){
                    
                    Text("""
                            \(bodyText)
                        """)
                    .multilineTextAlignment(.leading)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .lineLimit(.max)

                    
                }
                
            }
            
            .layoutPriority(1)
            
            Spacer()
        }
        
        .frame(maxWidth: 350, maxHeight: (showFullPost ? 390 : 160), alignment: .center)
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(10)
        
    }
}


#Preview {
    HomeListRowView(user: "User", title: "Title", bodyText: "vhghjbb thntryh gtefhfrttr rthr", showFullPost: false)
}
