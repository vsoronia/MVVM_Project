//
//  ToDosViewModel.swift
//  IOS Assignment
//
//  Created by SORONIATIS Vasilis on 8/2/24.
//

import Foundation

protocol ToDosViewModelType: ObservableObject {
    var state: ToDosViewState { get set }
    var page: Int { get set }
    func fetchData(page: Int) async
    func fetchMoreToDos()
    func toDosReload()
}

class ToDosViewModel: ToDosViewModelType {
    
    @Published var state: ToDosViewState
    let toDosManager: any ToDosManagerType
    var appendedToDos = [ToDosData]()
    var page: Int
    var pages: Int = 1
    var currentTotalToDos: Int = 1
    var total: Int = 1
    
   
    init(
        page: Int = 1,
        toDosManager: ToDosManagerType
    )
    {
        self.state = .loading
        self.page = page
        self.toDosManager = toDosManager
    }
    
    @MainActor
    func fetchData(page: Int) async   {
        
        let paginationResults = await toDosManager.fetchToDosInfo()
            switch paginationResults {
            case .success(let response):
                self.pages = response.meta.pagination.pages
                self.total = response.meta.pagination.total
            case .failure(let error):
                print(error)
                break
            }

            let toDosResults = await toDosManager.fetchToDos(for: page)
            switch toDosResults {
            case .success(let toDosResults):
                appendedToDos.append(contentsOf: toDosResults.data)
                currentTotalToDos = appendedToDos.count

                self.state = .toDos(appendedToDos)
                
            case .failure(let error):
                self.state = .error(error.localizedDescription)
                print(error)
                break
            }
    }
    
    @MainActor
    func fetchMoreToDos() {
        
        Task {
            
            if page < pages && currentTotalToDos < total {
                
                page += 1
                
                await fetchData(page: page)

            }
        }
    }
    @MainActor
    func toDosReload()  {
        Task{
            appendedToDos = []
            await fetchData(page: 1)
        }
    }
}


enum ToDosViewState {
    case loading
    case toDos([ToDosData])
    case error(String)
}
