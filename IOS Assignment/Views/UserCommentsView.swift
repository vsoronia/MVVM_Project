//
//  UserCommentsView.swift
//  IOS Assignment
//
//  Created by SORONIATIS Vasilis on 23/2/24.
//

import SwiftUI

struct UserCommentsView<ViewModelType>: View where ViewModelType: UserCommentsViewModelType {
    
    @ObservedObject var userCommentsViewModel: ViewModelType
    let userID: Int
    
    init(
        viewModel: ViewModelType,
        userID: Int
    )
    {
        self.userCommentsViewModel = viewModel
        self.userID = userID
    }
    
    var body: some View {
        
        ZStack {
            ThemeManager.shared.colors.backgroundGradientHomeTodos
                .ignoresSafeArea()
            
            switch userCommentsViewModel.state {
                
            case .loading:
                
                ProgressView()
                
            case .isEmpty:
                ScrollView{
                    Text(verbatim: .userWithNoComments)
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
