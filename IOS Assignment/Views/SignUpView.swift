//
//  SignUpView.swift
//  IOS Assignment
//
//  Created by SORONIATIS Vasilis on 8/3/24.
//

import SwiftUI

struct SignUpView: View {
    
    @ObservedObject var signUpViewModel = SignUpViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    VStack(alignment: .leading) {
                        
                        TextField("Enter Firstname", text: $signUpViewModel.firstName)
                            .textFieldStyle(.roundedBorder)
                        Text(signUpViewModel.firstNameErrorMessage)
                            .foregroundColor(.red)
                            .font(.footnote)
                            .opacity(signUpViewModel.firstNameErrorMessage.isEmpty ? 0.0 : 1.0)
                    }
                    
                    VStack(alignment: .leading) {
                        TextField("Enter Lastname", text: $signUpViewModel.lastName)
                            .textFieldStyle(.roundedBorder)
                        Text(signUpViewModel.lastNameErrorMessage)
                            .foregroundColor(.red)
                            .font(.footnote)
                            .opacity(signUpViewModel.lastNameErrorMessage.isEmpty ? 0.0 : 1.0)
                    }
                    
                    VStack(alignment: .leading) {
                        TextField("Enter email", text: $signUpViewModel.email)
                            .textFieldStyle(.roundedBorder)
                        Text(signUpViewModel.emailErrorMessage)
                            .foregroundColor(.red)
                            .font(.footnote)
                            .opacity(signUpViewModel.emailErrorMessage.isEmpty ? 0.0 : 1.0)
                    }
                    
                    VStack(alignment: .leading) {
                        TextField("Enter Your age", text: $signUpViewModel.age)
                            .textFieldStyle(.roundedBorder)
                        Text(signUpViewModel.ageErrorMessage)
                            .foregroundColor(.red)
                            .font(.footnote)
                            .opacity(signUpViewModel.ageErrorMessage.isEmpty ? 0.0 : 1.0)
                    }
                    
                    
                    VStack(alignment: .leading) {
                        SecureField("Enter password", text: $signUpViewModel.password)
                            .textFieldStyle(.roundedBorder)
                        
                        Text(signUpViewModel.passwordErrorMessage)
                            .foregroundColor(.red)
                            .font(.footnote)
                            .opacity(signUpViewModel.passwordErrorMessage.isEmpty ? 0.0 : 1.0)
                    }
                    
                    VStack(alignment: .leading) {
                        SecureField("Confirm password", text: $signUpViewModel.confirmPassword)
                            .textFieldStyle(.roundedBorder)
                        Text(signUpViewModel.confirmPasswordErrorMessage)
                            .foregroundColor(.red)
                            .font(.footnote)
                            .opacity(signUpViewModel.confirmPasswordErrorMessage.isEmpty ? 0.0 : 1.0)
                    }
                    
                    HStack {
                        Spacer()
                        Button {
                            print("SignUp")
                        } label: {
                            Label("SignUp", systemImage: "lock.shield")
                        }
                        .buttonStyle(.bordered)
                        .disabled(!signUpViewModel.isValid)
                        
                        Spacer()
                    }
                }
                .padding()
                .navigationTitle("SignUp Form")
            }
            .scrollDismissesKeyboard(.immediately)
        }
    }
}

#Preview {
    SignUpView()
}
