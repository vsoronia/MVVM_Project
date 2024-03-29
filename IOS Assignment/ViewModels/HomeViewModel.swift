//
//  FetcheData.swift
//  IOS Assignment
//
//  Created by SORONIATIS Vasilis on 17/1/24.
//

import Foundation

protocol HomeViewModelType: ObservableObject {
    var state: HomeViewState { get set }
    var page: Int { get set }
    func fetchData(page: Int) async
    func fetchMorePosts()
    func postsReload()
}

class HomeViewModel: HomeViewModelType {
    
    @Published var state: HomeViewState
    let homeManager: any HomeManagerType
    var appendedPosts = [HomePostData]()
    var page: Int
    var pages: Int = 1
    var currentTotalPosts: Int = 1
    var total: Int = 1
    
   
    init(
        page: Int,
        homeManager: HomeManagerType = HomeManager(service: NetworkingService())
    )
    {
        self.state = .loading
        self.page = page
        self.homeManager = homeManager
    }
    
    @MainActor
    func fetchData(page: Int) async   {
        
        let paginationResults = await homeManager.fetchPageInfo()
            switch paginationResults {
            case .success(let response):
                self.pages = response.meta.pagination.pages
                self.total = response.meta.pagination.total
            case .failure(let error):
                print(error)
                break
            }

            let postResults = await homeManager.fetchPosts(for: page)
            switch postResults {
            case .success(let postResults):
                appendedPosts.append(contentsOf: postResults.data)
                currentTotalPosts = appendedPosts.count

                self.state = .posts(appendedPosts)
                
            case .failure(let error):
                self.state = .error(error.localizedDescription)
                print(error)
                break
            }
    }
    
    @MainActor
    func fetchMorePosts() {
        
        Task {
            
            if page < pages && currentTotalPosts < total {
                
                page += 1
                
                await fetchData(page: page)

            }
        }
    }
    @MainActor
    func postsReload()  {
        Task{
            appendedPosts = []
            await fetchData(page: 1)
        }
    }
}


enum HomeViewState {
    case loading
    case posts([HomePostData])
    case error(String)
}
