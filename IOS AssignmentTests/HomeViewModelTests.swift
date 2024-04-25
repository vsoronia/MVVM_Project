//
//  IOS_AssignmentTests.swift
//  IOS AssignmentTests
//
//  Created by SORONIATIS Vasilis on 29/2/24.
//

import XCTest
@testable import IOS_Assignment


class HomeViewModelTests: XCTestCase {
    
    let viewModel = HomeViewModel(page: 1, homeManager: MockHomeManager(service: MockNetworkingService()))
    
    let expectedPosts = [
        HomePostData(id: 117182, user_id: 6826802, title: "Ducimus caveo somnus delinquo adficio abbas caelestis tertius.", body: "Audacia thymbra abeo. Correptius toties trans. Venia alii at. Optio spargo toties. Commodo amet vorago. Autem facere non. Vel quaerat recusandae. Non rerum tergum. Basium alius repellat. Et esse viduata."),
        HomePostData(id: 117181, user_id: 6826802, title: "Deleniti versus validus autus amaritudo tamen copiose attollo.", body: "Deprecator quis creo. Alveus cum ait. Amplexus aufero caecus. Aspernatur succedo solus. Succurro absconditus voro. Certo autem delego. Sollers comedo tutis. Vindico valetudo terminatio. Abbas paens veritatis. Capio et nisi. Ullam pax sint. Veritatis compello attollo. Cohaero vicissitudo arbitro. Vox caries et. Volubilis quibusdam harum. Unde claudeo qui. Ancilla vita amita."),
        HomePostData(id: 117105, user_id: 6825902, title: "Cupiditas pauci absorbeo patior nobis vestrum sub.", body: "Curiositas tremo credo. Adicio timor vapulus. Illo somnus adulescens. Deserunt corporis abduco. Ait adimpleo venio. Vesica comptus bellum. Ustulo absorbeo absens. Vestigium cattus qui. Alii tabula vita. Ter consectetur neque. Viduata admiratio textor.")
    ]
    
    override func setUp() async throws {
        print("HomeViewModelTests setup")
    }
    
    func testBoundaryConditions() async {
        await viewModel.fetchData(page: viewModel.pages)
        viewModel.page = viewModel.pages
        await viewModel.fetchMorePosts()
        XCTAssertEqual(viewModel.page, viewModel.pages)
    }
    func testDataOrder() async {
        
        await viewModel.fetchData(page: 1)
        
        switch viewModel.state {
        case .posts(let posts):
            XCTAssertEqual(posts, expectedPosts)
        default:
            XCTFail("Expected .posts state")
        }
    }
    
    func testPostsReload() async {

        await viewModel.fetchData(page: 1)
        await viewModel.postsReload()
        
        switch viewModel.state {
        case .posts(let posts):
            XCTAssertEqual(posts, expectedPosts)
        default:
            XCTFail("Expected .posts state")
        }
    }
    
    func testFetchMorePosts() async {
        
        await viewModel.fetchData(page: 1)
        await viewModel.fetchMorePosts()

        switch viewModel.state {
        case .posts(let posts):
            XCTAssertEqual(posts.count, 2*expectedPosts.count)
            XCTAssertEqual(posts, expectedPosts + expectedPosts)
        default:
            XCTFail("Expected .posts state")
        }
    }
}

