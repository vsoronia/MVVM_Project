//
//  IOS_AssignmentTests.swift
//  IOS AssignmentTests
//
//  Created by SORONIATIS Vasilis on 29/2/24.
//

import XCTest

@testable import IOS_Assignment

class IOS_AssignmentTests: XCTestCase {
    
    let viewModel = HomeViewModel(page: 1)
    
    func testFetchData() async  {
        
        await viewModel.fetchData(page: 1)
        
        XCTAssertEqual(self.viewModel.currentTotalPosts, 10)
    }
    
    func testBoundaryConditions() async {

        await viewModel.fetchData(page: viewModel.pages)
        viewModel.page = viewModel.pages
        await viewModel.fetchMorePosts()
        XCTAssertEqual(viewModel.page, viewModel.pages)

        
    }
}
