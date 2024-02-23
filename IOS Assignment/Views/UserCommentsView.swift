//
//  UserCommentsView.swift
//  IOS Assignment
//
//  Created by SORONIATIS Vasilis on 23/2/24.
//

import SwiftUI

struct UserCommentsView: View {
    
    @ObservedObject var userCommentsViewModel: UserCommentsViewModel
    let userID: Int
    
    init(
        viewModel: UserCommentsViewModel,
        userID: Int
    )
    {
        self.userCommentsViewModel = viewModel
        self.userID = userID
    }
    
    var body: some View {
        
        ZStack {
            LinearGradient(colors: [.colorBlackLight, .colorBlackDark], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            switch userCommentsViewModel.state {
                
            case .loading:
                
                ProgressView()
                
            case .isEmpty:
                ScrollView{
                    Text("No Comments yet.")
                        .font(.title)
                        .padding(30)
                }
                .refreshable {
                    userCommentsViewModel.userCommentsReload(userID: userID)
                }
                
                
            case .userComments(let comments):
                
                ScrollView {
                    
                    ForEach(comments) { comment in
                        UserCommentsRowView(name: comment.name, email: comment.email, bodyText: comment.body)
                        
                        
                            .padding(.vertical, 5)
                            .padding(.horizontal, 12)
                    }
                }
                .refreshable {
                    userCommentsViewModel.userCommentsReload(userID: userID)
                }
                
            case .error(let error):
                
                Text(error)
                
            }
        }
        .task {
            await userCommentsViewModel.fetchData(userID: userID)
        }
    }
}
//
//#Preview {
//    UserCommentsView()
//}
