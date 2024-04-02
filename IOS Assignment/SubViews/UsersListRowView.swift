//
//  UsersListRowView.swift
//  IOS Assignment
//
//  Created by SORONIATIS Vasilis on 5/2/24.
//

import SwiftUI

struct UsersListRowView: View {
    
    var isActive: Bool = false
    let name: String
    let email: String
    let gender: String

    init(
        isActive: Bool,
        name: String,
        email: String,
        gender: String
    )
    {
        self.isActive = isActive
        self.name = name
        self.email = email
        self.gender = gender
    }
    
    var body: some View {
        
            ZStack {
                
                VStack(alignment: .leading) {
                    HStack(alignment: .top) {
                        
                        if isActive {
                            ThemeManager.shared.images.isActiveUser
                                .symbolEffect(.pulse.wholeSymbol, options: .repeating)
                                .foregroundStyle(Color(.green))
                                .accessibilityLabel(String.accessibilityActiveUser)
                        }
                        
                        else {
                            ThemeManager.shared.images.isInactiveUser
                                .foregroundStyle(Color(.gray))
                                .accessibilityLabel(String.accessibilityInactiveUser)
                        }
                    }
                    .frame(maxWidth: 340,maxHeight: 150,alignment: .topLeading)
                }
                
                    VStack{
                        Text(name)
                            .frame(maxWidth: 280)
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundStyle(Color.black)
                            .padding(1)
                        
                        
                        Text(email)
                            .font(.subheadline)
                            .fontWeight(.regular)
                            .padding(1)
                        
                        
                        Text(gender)
                        
                            .foregroundStyle(Color(.black))
                            .font(.caption)
                            .padding(2)
                }
            }
            
        .frame(maxWidth: 350, maxHeight: 160, alignment: .center)
        .padding()
        .background(Color.colorUsers)
        .cornerRadius(25)
    }
}

#Preview {
    ZStack {
        Color.black

            UsersListRowView(isActive: true, name: "ggg", email: "ggg@g.com", gender: "male")
    }
}
