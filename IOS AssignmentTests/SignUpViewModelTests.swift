//
//  SignUpViewModelTests.swift
//  IOS AssignmentTests
//
//  Created by SORONIATIS Vasilis on 10/4/24.
//

import XCTest

@testable import IOS_Assignment

class SignUpViewModelTests: XCTestCase {
   
    var graphController: GraphController!
    
    var viewModel: SignUpViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = SignUpViewModel()
        viewModel.firstName = "John"
        viewModel.lastName = "Doe"
        viewModel.age = "30"
        viewModel.email = "john.doe@example.com"
        viewModel.password = "Abc@1234"
        viewModel.confirmPassword = "Abc@1234"
    }
    override func setUp() async throws {
      graphController = GraphController.shared
      graphController.loadAssemblies([MockAssembly()])
    }
  
    override func tearDown() async throws {
        graphController = nil
    }

    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
 
   func testValidForm() {
       let expectation = XCTestExpectation(description: "Form validation")
       
       DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
           XCTAssertTrue(self.viewModel.isValid)
           XCTAssertEqual(self.viewModel.firstNameErrorMessage, "")
           XCTAssertEqual(self.viewModel.lastNameErrorMessage, "")
           XCTAssertEqual(self.viewModel.ageErrorMessage, "")
           XCTAssertEqual(self.viewModel.emailErrorMessage, "")
           XCTAssertEqual(self.viewModel.passwordErrorMessage, "")
           XCTAssertEqual(self.viewModel.confirmPasswordErrorMessage, "")
           expectation.fulfill()
       }
       
       wait(for: [expectation], timeout: 2)
   }
   
   func testInvalidEmail() {
       let expectation = XCTestExpectation(description: "Email validation")
       
       viewModel.email = "invalidemail.com"
       
       DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
           XCTAssertFalse(self.viewModel.isValid)
           XCTAssertEqual(self.viewModel.emailErrorMessage, .errorEmail)
           expectation.fulfill()
       }
       
       wait(for: [expectation], timeout: 2)
   }
   
   func testWeakPassword() {
       let expectation = XCTestExpectation(description: "Password strength validation")
       
       viewModel.password = "weakpass"
       viewModel.confirmPassword = "weakpass"
       
       DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
           XCTAssertFalse(self.viewModel.isValid)
           XCTAssertEqual(self.viewModel.passwordErrorMessage, .weakErrorPassword)
           expectation.fulfill()
       }
       
       wait(for: [expectation], timeout: 2)
   }
   
   func testPasswordMismatch() {
       let expectation = XCTestExpectation(description: "Password match validation")
       
       viewModel.password = "Abc@1234"
       viewModel.confirmPassword = "Xyz@1234"
       
       DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
           XCTAssertFalse(self.viewModel.isValid)
           XCTAssertEqual(self.viewModel.confirmPasswordErrorMessage, .errorConfirmPassword)
           expectation.fulfill()
       }
       
       wait(for: [expectation], timeout: 2)
   }
   
   func testIsPasswordStrong() {
       let expectation = XCTestExpectation(description: "Password strength check")
       
       DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
           XCTAssertTrue(self.viewModel.isPasswordStrong(password: "Abc@1234"))
           XCTAssertFalse(self.viewModel.isPasswordStrong(password: "weakpass"))
           expectation.fulfill()
       }
       
       wait(for: [expectation], timeout: 2)
   }
   
}

