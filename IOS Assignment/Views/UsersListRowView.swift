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
                
                
                
                VStack {
                    HStack {
                        
                        if isActive {
                            Image(systemName: "smallcircle.filled.circle.fill")
                                .symbolEffect(.pulse.wholeSymbol, options: .repeating)
                                .foregroundStyle(Color(.green))
                                .padding(5)
                        }
                        
                        else {
                            Image(systemName: "smallcircle.filled.circle.fill")
                                .foregroundStyle(Color(.gray))
                                .padding(5)
                        }
                        
                        Spacer()
                    }
                    Spacer()
                }
                
                VStack{
                    Text(name)
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundStyle(Color.black)
                        .padding(1)
                    
                    
                    Text(email)
//                        .foregroundStyle(Color(.white))
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

//#Preview {
//    ZStack {
//        Color.black
//        HStack {
//            UsersListRowView()
//            Spacer()
//            UsersListRowView()
//        }
//        .padding(.horizontal,3)
//    }
//}
