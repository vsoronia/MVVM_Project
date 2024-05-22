//
//  SnapshotTest.swift
//  IOS AssignmentTests
//
//  Created by SORONIATIS Vasilis on 18/4/24.
//

import SwiftUI
import SnapshotTesting
import XCTest
@testable import IOS_Assignment

class SnapshotTest: XCTestCase {
    var graphController: GraphController!
    
    let expectation = XCTestExpectation(description: "Data loading expectation")

    let showMenu = Binding.constant(false)
    let selectedSideMenuTab = Binding.constant(0)
    let showAnimation = Binding.constant(false)
    let loadedFirstTime = Binding.constant(true)
    
    
    override func setUp() async throws {
      graphController = GraphController.shared
      graphController.loadAssemblies([MockAssembly()])
    }
  
    override func tearDown() async throws {
        graphController = nil
    }
    
    func testHomeView() {
        
        let viewModel = HomeViewModel(page: 1, homeManager: MockHomeManager(service: MockNetworkingService()))

        let view = HomeView(
            showMenu: showMenu,
            showAnimation: showAnimation,
            selectedSideMenuTab: selectedSideMenuTab,
            viewModel: viewModel,
            loadedFirstTime: loadedFirstTime
        )

        let viewController = UIHostingController(rootView: view)
        
        Task {
            await viewModel.fetchData(page: 1)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: TimeInterval(5.0))

        assertSnapshot(
            of: viewController,
            as: .image(on: .iPhone13ProMax),
            record: false
        )
    }
    
    func testUsersView() {
        
        let viewModel = UsersViewModel(page: 1, userManager: MockUsersManager(service: MockNetworkingService()))

        let view = UsersView(
            showMenu: showMenu,
            showAnimation: showAnimation,
            selectedSideMenuTab: selectedSideMenuTab,
            viewModel: viewModel,
            loadedFirstTime: loadedFirstTime
        )

        let viewController = UIHostingController(rootView: view)
        
        Task {
            await viewModel.fetchData(page: 1)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: TimeInterval(5.0))

        assertSnapshot(
            of: viewController,
            as: .image(on: .iPhone13ProMax),
            record: false
        )
    }
    
    func testToDosView() {
        
        let viewModel = ToDosViewModel(page: 1, toDosManager: MockToDosManager(service: MockNetworkingService()))

        let view = ToDosView(
            showMenu: showMenu,
            showAnimation: showAnimation,
            selectedSideMenuTab: selectedSideMenuTab,
            viewModel: viewModel,
            loadedFirstTime: loadedFirstTime
        )

        let viewController = UIHostingController(rootView: view)
        
        Task {
            await viewModel.fetchData(page: 1)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: TimeInterval(5.0))

        assertSnapshot(
            of: viewController,
            as: .image(on: .iPhone13ProMax),
            record: false
        )
    }
    
    func testUsersDetailView() {
        let viewModel = UsersDetailViewModel(usersDetailManager: MockUsersDetailManager())
        
        let view = UsersDetailView(
            viewModel: viewModel,
            userDeleted: .constant(false),
            userID: 6859467)
        
        let viewController = UIHostingController(rootView: view)
        
        Task {
            await viewModel.fetchData(userID:6859467)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: TimeInterval(5.0))

        assertSnapshot(
            of: viewController,
            as: .image(on: .iPhone13ProMax),
            record: false
        )
    }
    
    func testAboutUsView() {
        let view = AboutUsView(showMenu: .constant(false), showAnimation: .constant(false), selectedSideMenuTab: .constant(3))
        
        let viewController = UIHostingController(rootView: view)
        
        assertSnapshot(
            of: viewController,
            as: .image,
            record: false
        )
    }
}
