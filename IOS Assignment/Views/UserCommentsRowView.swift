//
//  UserCommentsRowView.swift
//  IOS Assignment
//
//  Created by SORONIATIS Vasilis on 23/2/24.
//

import SwiftUI

struct UserCommentsRowView: View {
    let name: String
    let email: String
    let bodyText: String

    
    init(
        name: String,
        email: String,
        bodyText: String
    )
    {
        self.name = name
        self.email = email
        self.bodyText = bodyText
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .center) {
                Text(name)
                    .font(.headline)
                    .foregroundColor(.primary)
                
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .foregroundStyle(LinearGradient(colors:[.colorSeconderyPlaceholder,.colorPlaceholder], startPoint: .topLeading, endPoint: .bottomTrailing) )
                    .clipShape(Circle())

                Spacer()
                                
            }
            
            Spacer()
            
            VStack(alignment: .center) {
                
                
                Text(email)
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
        
        .frame(maxWidth: 350, maxHeight: (390), alignment: .center)
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(10)
        
    }
}

#Preview {
    UserCommentsRowView(name: "vasilis", email: "sssss", bodyText: "BHjhjjhbjhjh bhjgbjgu")
}
