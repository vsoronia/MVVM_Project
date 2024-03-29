//
//  UserPostsView.swift
//  IOS Assignment
//
//  Created by SORONIATIS Vasilis on 12/2/24.
//

import SwiftUI

struct UserPostsView<ViewModelType>: View where ViewModelType: UserPostsViewModelType {
    
    @ObservedObject var userPostsViewModel: ViewModelType
    let userID: Int
    
    init(
        viewModel: ViewModelType,
        userID: Int
    )
    {
        self.userPostsViewModel = viewModel
        self.userID = userID
    }
    
    var body: some View {
        
        ZStack {
            ThemeManager.shared.colors.backgroundGradientHomeTodos
                .ignoresSafeArea()
            
            switch userPostsViewModel.state {
                
            case .loading:
                
                ProgressView()
                
            case .isEmpty:
                ScrollView{
                    Text(verbatim: .userWithNoPosts)
                        .font(.title)
                        .padding(30)
                }
                .refreshable {
                    userPostsViewModel.userPostsReload(userID: userID)
                }
                
                
            case .userPosts(let posts):
                
                ScrollView {
                    
                    ForEach(posts) { post in
                        UserPostsListRowView(user: "User", title: post.title, bodyText: post.body)
                        
                        
                            .padding(.vertical, 5)
                            .padding(.horizontal, 12)
                    }
                }
                .refreshable {
                    userPostsViewModel.userPostsReload(userID: userID)
                }
                
            case .error(let error):
                
                Text(error)
                
            }
        }
        .task {
            await userPostsViewModel.fetchData(userID: userID)
        }
    }
}


//#Preview {
//    UserPostsView(viewModel: UserPostsViewModel(), userID: 6265160)
//}
