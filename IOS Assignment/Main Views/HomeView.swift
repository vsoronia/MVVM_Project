//
//  HomeView.swift
//  IOS Assignment
//
//  Created by SORONIATIS Vasilis on 23/1/24.
//

import SwiftUI

struct HomeView: View {
    
    // MARK: - PROPERTIES
    @Binding var showMenu: Bool
    @Binding var showAnimation: Bool
    @Binding var selectedSideMenuTab: Int
    @ObservedObject var homeViewModel: HomeViewModel
    @State var expandedItems = Set<Int>()
    @Binding var loadedFirstTime: Bool



    
    init(
        showMenu: Binding<Bool>,
        showAnimation: Binding<Bool>,
        selectedSideMenuTab: Binding<Int>,
        viewModel: HomeViewModel,
        loadedFirstTime: Binding<Bool>

        
    ) {
        self._showMenu = showMenu
        self._selectedSideMenuTab = selectedSideMenuTab
        self._showAnimation = showAnimation
        self.homeViewModel = viewModel
        self._loadedFirstTime = loadedFirstTime

    }
    
    
    // MARK: - BODY
    var body: some View {
        
        NavigationStack {
            ZStack {
                LinearGradient(colors: [.colorBlackLight, .colorBlackDark], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                
                switch homeViewModel.state {
                    
                case .loading:
                    
                    ProgressView()
                    
                case .posts(let items):
                    
                    ScrollView {

                            ForEach(items) { post in
                                HomeListRowView(user: "User", title: post.title, bodyText: post.body, showFullPost:expandedItems.contains(post.id))
                                    .onTapGesture {
                                        withAnimation(.easeInOut(duration: 0.3)){
                                            tappedId(post.id)
                                        }
                                    }                                  
                                    .padding(.vertical, 5)
                                    .padding(.horizontal, 12)
                            }
                    
                        LazyVStack{
                            ProgressView()
                                .padding(.horizontal, 200)
                                .onAppear() {
                                    
                                    homeViewModel.fetchMorePosts()
                                    
                                }
                        }
                    }
                    .refreshable {
                        homeViewModel.postsReload()
                    }
                    
                case .error(let error):
                    
                    Text(error)
                    
                }
            }
            .navigationBarTitle(SideMenuRowViewModel.home.title, displayMode: .inline)
            .modifier(NavigationBarModifier(showMenu: $showMenu, showAnimation: $showAnimation))
            .task {
                if loadedFirstTime{
                    await homeViewModel.fetchData(page: homeViewModel.page)
                    loadedFirstTime.toggle()
                }
            }
        }
    }
}


extension HomeView {
    func tappedId(_ element: Int) {
        if expandedItems.contains(element) {
            expandedItems.remove(element)
        } else {
            expandedItems.insert(element)
        }
    }
}



// MARK: - PREVIEW

//struct HomeView_Previews: PreviewProvider {
//    @State static var showMenu = true
//    @State static var selectedSideMenuTab:Int = 0
//    @State static var showAnimation = true
//    
//    static var previews: some View {
//        HomeView(showMenu: $showMenu, showAnimation: $showAnimation, selectedSideMenuTab: $selectedSideMenuTab, viewModel: HomeViewModel(service: NetworkingService(), page: 1))
//        
//    }
//}
