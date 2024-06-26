//
//  UsersView.swift
//  IOS Assignment
//
//  Created by SORONIATIS Vasilis on 23/1/24.
//

import SwiftUI


struct UsersView<ViewModelType>: View where ViewModelType: UsersViewModelType {
    
    @ObservedObject var router = Router()
    @Binding var showMenu: Bool
    @Binding var showAnimation: Bool
    @Binding var selectedSideMenuTab: Int
    @ObservedObject var usersViewModel: ViewModelType
    @Binding var loadedFirstTime: Bool
    @State var active: Bool = false
    @State var userDeleted: Bool = false
    let usersDetailViewModel: UsersDetailViewModel = GraphController.shared.assembler.resolver.resolve(UsersDetailViewModel.self)!
    let userPostsViewModel: UserPostsViewModel = GraphController.shared.assembler.resolver.resolve(UserPostsViewModel.self)!
    let userToDosViewModel: UserToDosViewModel = GraphController.shared.assembler.resolver.resolve(UserToDosViewModel.self)!
    let userCommentsViewModel: UserCommentsViewModel = GraphController.shared.assembler.resolver.resolve(UserCommentsViewModel.self)!

    
    init(
        showMenu: Binding<Bool>,
        showAnimation: Binding<Bool>,
        selectedSideMenuTab: Binding<Int>,
        viewModel: ViewModelType,
        loadedFirstTime: Binding<Bool>
    ) {
        self._showMenu = showMenu
        self._selectedSideMenuTab = selectedSideMenuTab
        self._showAnimation = showAnimation
        self.usersViewModel = viewModel
        self._loadedFirstTime = loadedFirstTime
        
    }
    
    var body: some View {
        NavigationStack(path: $router.navPath) {
            ZStack {
                
                ThemeManager.shared.colors.backgroundGradientUsers
                    .ignoresSafeArea()
                
                switch usersViewModel.state {
                    
                case .loading:
                    
                    ProgressView()
                    
                case .users(let items):
                    
                    ScrollView {
                        
                        ForEach(items) { user in Button(){router.navigate(to: .userDetails(id: user.id))}label:{
                            UsersListRowView(isActive: isActive(status: user.status), name: user.name, email: user.email, gender: user.gender)
                            
                                .padding(.vertical, 5)
                                .padding(.horizontal, 12)
                        }
                        }
                        LazyVStack{
                            ProgressView()
                                .padding(.horizontal, 200)
                                .onAppear() {
                                    
                                    Task{await usersViewModel.fetchMoreUsers()}
                                    
                                }
                        }
                    }
                    .onAppear() {
                        if userDeleted {
                            usersViewModel.usersReload()
                            userDeleted.toggle()
                        }
                    }
                    .refreshable {
                         usersViewModel.usersReload()
                    }
                    
                    
                case .error(let error):
                    
                    Text(error)
                    
                }
            }
            .navigationDestination(for: Destination.self) { destination in
                
                switch destination {
                case .userDetails(let id):
                    UsersDetailView(viewModel: usersDetailViewModel, userDeleted: $userDeleted, userID: id)
                case .userPosts(let id):
                    UserPostsView(viewModel: userPostsViewModel, userID: id)
                case .userComments(let id):
                    UserCommentsView(viewModel: userCommentsViewModel, userID: id)
                case .userTodos(let id):
                    UserToDosView(viewModel: userToDosViewModel, userID: id)
                }
            }
            .navigationBarTitle(SideMenuRowViewModel.users.title, displayMode: .inline)
            .modifier(NavigationBarModifier(showMenu: $showMenu, showAnimation: $showAnimation))
            .task {
                if loadedFirstTime{
                    await usersViewModel.fetchData(page: usersViewModel.page)
                    loadedFirstTime.toggle()
                }
            }
        }
        .environmentObject(router)

    }
}

extension UsersView {
    func isActive(status: Status) -> Bool {
        if status == .active {
            return true
        }
        else{
            return false
        }
    }
}


//struct UserView_Previews: PreviewProvider {
//    @State static var showMenu = true
//    @State static var selectedSideMenuTab:Int = 0
//    @State static var showAnimation = true
//
//    static var previews: some View {
//        UsersView(showMenu: $showMenu, showAnimation: $showAnimation, selectedSideMenuTab: $selectedSideMenuTab)
//
//    }
//}
//
