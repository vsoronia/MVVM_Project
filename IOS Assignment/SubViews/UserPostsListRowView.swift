//
//  UserPostsListRowView.swift
//  IOS Assignment
//
//  Created by SORONIATIS Vasilis on 12/2/24.
//


import SwiftUI

struct UserPostsListRowView: View {
    
    
    let user: String
    let title: String
    let bodyText: String
    
    
    init(
        user: String,
        title: String,
        bodyText: String
        
    )
    {
        self.user = user
        self.title = title
        self.bodyText = bodyText
        
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .center) {
                Text(user)
                    .font(.headline)
                    .foregroundColor(.primary)
                
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .foregroundStyle(LinearGradient(colors:[.colorSecondaryPlaceholder,.colorPlaceholder], startPoint: .topLeading, endPoint: .bottomTrailing) )
                    .clipShape(Circle())
                
                Spacer()
                
                
            }
            
            Spacer()
            
            VStack(alignment: .center) {
                
                
                Text(title)
                    .font(.title3)
                    .foregroundColor(.primary)
                    .padding(3)
                

                Text("""
                            \(bodyText)
                        """)
                .multilineTextAlignment(.leading)
                .font(.body)
                .foregroundColor(.secondary)
                .lineLimit(.max)
                .padding()
                
                Spacer()
            }
            
            
            Spacer()
        }
        
        .frame(maxWidth: 350, maxHeight: 390, alignment: .center)
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(10)
        
    }
}

#Preview {
    ZStack {
        Color.black
        UserPostsListRowView(user: "User", title: "Title", bodyText: "gghghv jbhbb")
    }
}
