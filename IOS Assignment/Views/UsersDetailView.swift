//
//  UsersDetailView.swift
//  IOS Assignment
//
//  Created by SORONIATIS Vasilis on 6/2/24.
//

import SwiftUI

struct UsersDetailView: View {
    
    @EnvironmentObject var router: Router
    @ObservedObject var usersDetailViewModel: UsersDetailViewModel
    @Binding var userDeleted: Bool
    @State var showAlert: Bool = false
    let userID: Int

    
    init(
        viewModel: UsersDetailViewModel,
        userDeleted: Binding<Bool>,
        userID: Int
        
    )
    {
        self.usersDetailViewModel = viewModel
        self._userDeleted = userDeleted
        self.userID = userID
        
    }
    
    
    
    var body: some View {
        
        ZStack {
            LinearGradient(colors: [.colorBlackLight, .colorBlackMedium], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            CustomCircleView(ShapeColor: .gray, ShapeOpacity: 0.1)
            
            switch usersDetailViewModel.state {
                
            case .loading:
                
                ProgressView()
                
            case .userDetails(let userDetails):
                VStack(alignment: .leading, spacing: 12){
                    
                    Text(userDetails.name)
                        .font(.title)
                    
                    Text("Email: \(userDetails.email)")
                        .foregroundColor(.gray)
                    
                    Text("Gender: \(userDetails.gender)")
                        .foregroundColor(.gray)
                    
                    Text("Status: \(userDetails.status)")
                        .foregroundColor(.gray)
                    Spacer()
                }
                
                
                HStack {
                    Spacer()
                    VStack(alignment: .center, spacing: 12){
                        Spacer()
                        
                        Button {
                            router.navigate(to: .userPosts(id: userID))
                        } label: {Text("Show Posts")}
                        
                            .foregroundColor(.blue)
                        
                        Button{
                            router.navigate(to: .userComments(id: userID))
                        } label: {Text("Show Comments")}
                        .foregroundColor(.blue)
                        
                        Button{
                            router.navigate(to: .userTodos(id: userID))
                        } label: {Text("Show TODOs")}
                        
                            .foregroundColor(.blue)
                        
                        Spacer()
                        
                        Button("Delete User", systemImage: "trash") {
                            showAlert.toggle()
                        }
                        .font(.title3)
                        .alert("Press Confirm to delete the user.",isPresented: $showAlert)  {
                            Button(action: {
                                deleteUser(toDeleteUserID: userDetails.id)
                            }, label: {
                                Text("Confirm")
                            })
                            
                            
                            Button(action: {
                                showAlert.toggle()
                            }, label: {
                                Text("Cancel")
                                    .foregroundStyle(Color.red)
                            })
                        }
                        .foregroundColor(.red)
                        
                    }
                    Spacer()
                }
                
                
            case .error(let error):
                Text(error)
                
            }
        }
        
        .task {
            usersDetailViewModel.fetchData(userID: userID)
            
        }
    }
}

extension UsersDetailView {
    func deleteUser(toDeleteUserID: Int) {
        Task{
        let result = await usersDetailViewModel.deleteUser(userID: toDeleteUserID)
            switch result {
            case .success(_):
                userDeleted.toggle()
                router.navigateBack()
            case .failure(let error):
                //Maybe I put View States here
                print(error.localizedDescription)
            }
        }
    }
}

//#Preview {
//    UsersDetailView(viewModel: UsersDetailViewModel(), userID: 6180424, userDeleted: .constant(false))
//}
