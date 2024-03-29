//
//  ToDosView.swift
//  IOS Assignment
//
//  Created by SORONIATIS Vasilis on 23/1/24.
//

import SwiftUI


struct ToDosView<ViewModelType>: View where ViewModelType: ToDosViewModelType{
    @Binding var showMenu:Bool
    @Binding var showAnimation: Bool
    @Binding var selectedSideMenuTab: Int
    @ObservedObject var toDosViewModel: ViewModelType
    @Binding var loadedFirstTime: Bool



    
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
        self.toDosViewModel = viewModel
        self._loadedFirstTime = loadedFirstTime
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                ThemeManager.shared.colors.backgroundGradientHomeTodos
                    .ignoresSafeArea()
                
                switch toDosViewModel.state {
                    
                case .loading:
                    
                    ProgressView()
                    
                case .toDos(let toDos):
                    
                    ScrollView {

                            ForEach(toDos) { toDo in
                                ToDosListRowView(viewModel: ToDosListRowViewModel(user: "User", title: toDo.title, dueOn: toDo.due_on, taskStatus: isPending(status: toDo.status)))
                                    .padding(.vertical, 5)
                                    .padding(.horizontal, 12)
                            }
                    
                        LazyVStack{
                            ProgressView()
                                .padding(.horizontal, 200)
                                .onAppear() {
                                    
                                    toDosViewModel.fetchMoreToDos()
                                    
                                }
                        }
                    }
                    .refreshable {
                        toDosViewModel.toDosReload()
                    }
                    
                case .error(let error):
                    
                    Text(error)
                    
                }

            }
            .navigationBarTitle(SideMenuRowViewModel.todos.title, displayMode: .inline)
            .modifier(NavigationBarModifier(showMenu: $showMenu, showAnimation: $showAnimation))
            .task {
                if loadedFirstTime{
                    await toDosViewModel.fetchData(page: toDosViewModel.page)
                    loadedFirstTime.toggle()
                }
            }

        }
        
    }
}

extension ToDosView {
    func isPending(status: TaskStatus) -> Bool {
        if status == .pending {
            return true
        }
        else{
            return false
        }
    }
}

//struct ToDosView_Previews: PreviewProvider {
//    @State static var showMenu = true
//    @State static var selectedSideMenuTab:Int = 0
//    @State static var showAnimation = true
//    
//    static var previews: some View {
//        ToDosView(showMenu: $showMenu, showAnimation: $showAnimation, selectedSideMenuTab: $selectedSideMenuTab)
//        
//    }
//}
