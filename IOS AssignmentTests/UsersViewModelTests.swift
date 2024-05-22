//
//  UsersViewModelTests.swift
//  IOS AssignmentTests
//
//  Created by SORONIATIS Vasilis on 22/4/24.
//

import XCTest
@testable import IOS_Assignment

class UsersViewModelTests: XCTestCase {
    
    var graphController: GraphController!
    
    let expectedUsers = [
        UsersData(id: 6859470, name: "Chitramala Banerjee", email: "chitramala_banerjee@macgyver-greenholt.test", gender: "male", status: Status.active),
        UsersData(id: 6859469, name: "Ritesh Banerjee", email: "banerjee_ritesh@tromp.example", gender: "male", status: Status.inactive),
        UsersData(id: 6859461, name: "Aasa Guha", email: "aasa_guha@morissette.example", gender: "female", status: Status.active)]
    
    let viewModel = UsersViewModel(page: 1, userManager: MockUsersManager(service: MockNetworkingService()))
    
    override func setUp() async throws {
      graphController = GraphController.shared
      graphController.loadAssemblies([MockAssembly()])
    }
  
    override func tearDown() async throws {
        graphController = nil
    }
    
    func testBoundaryConditions() async {
        await viewModel.fetchData(page: viewModel.pages)
        viewModel.page = viewModel.pages
        await viewModel.fetchMoreUsers()
        XCTAssertEqual(viewModel.page, viewModel.pages)
    }
    
    func testDataOrder() async {
        
        await viewModel.fetchData(page: 1)
        
        switch viewModel.state {
        case .users(let users):
            print(users)
            XCTAssertEqual(users, expectedUsers)
        default:
            XCTFail("Expected .users state")
        }
    }
    
    func testUsersReload() async {

        await viewModel.fetchData(page: 1)
        await viewModel.usersReload()
        
        switch viewModel.state {
        case .users(let users):
            XCTAssertEqual(users, expectedUsers)
        default:
            XCTFail("Expected .users state")
        }
    }
    
    func testFetchMoreUsers() async {
        
        await viewModel.fetchData(page: 1)
        await viewModel.fetchMoreUsers()

        switch viewModel.state {
        case .users(let users):
            XCTAssertEqual(users.count, 2*expectedUsers.count)
            XCTAssertEqual(users, expectedUsers + expectedUsers)
        default:
            XCTFail("Expected .users state")
        }
    }
}
