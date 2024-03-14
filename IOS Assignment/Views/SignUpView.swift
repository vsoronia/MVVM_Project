//
//  SignUpView.swift
//  IOS Assignment
//
//  Created by SORONIATIS Vasilis on 8/3/24.
//

import SwiftUI

struct SignUpView: View {
    
    @ObservedObject var signUpViewModel = SignUpViewModel()
    @Binding var signupViewIsPresented: Bool
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    VStack(alignment: .leading) {
                        
                        TextField(String.placeholderFirstName, text: $signUpViewModel.firstName)
                            .textFieldStyle(.roundedBorder)
                        Text(signUpViewModel.firstNameErrorMessage)
                            .foregroundColor(.red)
                            .font(.footnote)
                            .opacity(signUpViewModel.firstNameErrorMessage.isEmpty ? 0.0 : 1.0)
                    }
                    
                    VStack(alignment: .leading) {
                        TextField(String.placeholderLastName, text: $signUpViewModel.lastName)
                            .textFieldStyle(.roundedBorder)
                        Text(signUpViewModel.lastNameErrorMessage)
                            .foregroundColor(.red)
                            .font(.footnote)
                            .opacity(signUpViewModel.lastNameErrorMessage.isEmpty ? 0.0 : 1.0)
                    }
                    
                    VStack(alignment: .leading) {
                        TextField(String.placeholderEmail, text: $signUpViewModel.email)
                            .textFieldStyle(.roundedBorder)
                        Text(signUpViewModel.emailErrorMessage)
                            .foregroundColor(.red)
                            .font(.footnote)
                            .opacity(signUpViewModel.emailErrorMessage.isEmpty ? 0.0 : 1.0)
                    }
                    
                    VStack(alignment: .leading) {
                        TextField(String.placeholderAge, text: $signUpViewModel.age)
                            .textFieldStyle(.roundedBorder)
                        Text(signUpViewModel.ageErrorMessage)
                            .foregroundColor(.red)
                            .font(.footnote)
                            .opacity(signUpViewModel.ageErrorMessage.isEmpty ? 0.0 : 1.0)
                    }
                    
                    VStack(alignment: .leading) {
                        SecureField(String.placeholderPassword, text: $signUpViewModel.password)
                            .textFieldStyle(.roundedBorder)
                        
                        Text(signUpViewModel.passwordErrorMessage)
                            .foregroundColor(.red)
                            .font(.footnote)
                            .opacity(signUpViewModel.passwordErrorMessage.isEmpty ? 0.0 : 1.0)
                    }
                    
                    VStack(alignment: .leading) {
                        SecureField(String.placeholderConfirmPassword, text: $signUpViewModel.confirmPassword)
                            .textFieldStyle(.roundedBorder)
                        Text(signUpViewModel.confirmPasswordErrorMessage)
                            .foregroundColor(.red)
                            .font(.footnote)
                            .opacity(signUpViewModel.confirmPasswordErrorMessage.isEmpty ? 0.0 : 1.0)
                    }
                    
                    HStack {
                        Spacer()
                        Button {
                            signupViewIsPresented.toggle()
                            print("SignUp")
                        } label: {
                            Label(String.signUp, systemImage: "lock.shield")
                        }
                        .buttonStyle(.bordered)
                        .disabled(!signUpViewModel.isValid)
                        
                        Spacer()
                    }
                }
                .padding()
                .navigationTitle(String.signUpFormTitle)
            }
            .scrollDismissesKeyboard(.immediately)
        }
    }
}


//#Preview {
//    SignUpView()
//}
