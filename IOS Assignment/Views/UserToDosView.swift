//
//  UserToDosView.swift
//  IOS Assignment
//
//  Created by SORONIATIS Vasilis on 22/2/24.
//

import SwiftUI

struct UserToDosView: View {

    @ObservedObject var userToDosViewModel: UserToDosViewModel
    let userID: Int
    
    init(
        viewModel: UserToDosViewModel,
        userID: Int
    )
    {
        self.userToDosViewModel = viewModel
        self.userID = userID
    }
    
    var body: some View {
        
        ZStack {
            LinearGradient(colors: [.colorBlackLight, .colorBlackDark], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            switch userToDosViewModel.state {
                
            case .loading:
                
                ProgressView()
                
            case .isEmpty:
                ScrollView{
                    Text(verbatim: .userWithNoTodos)
                        .font(.title)
                        .padding(30)
                }
                .refreshable {
                    userToDosViewModel.userToDosReload(userID: userID)
                }
                
                
            case .userToDos(let toDos):
                
                ScrollView {
                    
                    ForEach(toDos) { toDo in
                        ToDosListRowView(viewModel: ToDosListRowViewModel(user: "User", title: toDo.title, dueOn: toDo.due_on, taskStatus: isPending(status: toDo.status)))
                            .padding(.vertical, 5)
                            .padding(.horizontal, 12)
                    }
                }
                .refreshable {
                    userToDosViewModel.userToDosReload(userID: userID)
                }
                
            case .error(let error):
                
                Text(error)
                
            }
        }
        
        .task {
            await userToDosViewModel.fetchData(userID: userID)
        }
    }
}

extension UserToDosView {
    func isPending(status: TaskStatus) -> Bool {
        if status == .pending {
            return true
        }
        else{
            return false
        }
    }
}

//#Preview {
//    UserToDosView()
//}
