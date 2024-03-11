//
//  SignUpViewModel.swift
//  IOS Assignment
//
//  Created by SORONIATIS Vasilis on 8/3/24.
//

import Foundation
import Combine

final class SignUpViewModel: ObservableObject {
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var age = ""
    @Published var email = ""
    @Published var password = ""
    @Published var confirmPassword = ""
    
    @Published var isValid = false
    
    @Published var firstNameErrorMessage = ""
    @Published var lastNameErrorMessage = ""
    @Published var ageErrorMessage = ""
    @Published var emailErrorMessage = ""
    @Published var passwordErrorMessage = ""
    @Published var confirmPasswordErrorMessage = ""
    
    private var cancellable = Set<AnyCancellable>()
    
    
    
    private var validFirstNamePublisher: AnyPublisher<Bool, Never> {
        $firstName
            .dropFirst(2)
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .map { $0.count >= 3 }
            .eraseToAnyPublisher()
    }
    
    private var validLastNamePublisher: AnyPublisher<Bool, Never> {
        $lastName
            .dropFirst(2)
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .map { $0.count >= 3 }
            .eraseToAnyPublisher()
    }
    
    private var validFirstLastNamePublisher: AnyPublisher<Bool, Never> {
        Publishers
            .CombineLatest(validFirstNamePublisher, validLastNamePublisher)
            .map { validFirstName, validLastName in
                validFirstName && validLastName
            }
            .eraseToAnyPublisher()
    }
    
    private var validEmailPublisher: AnyPublisher<Bool, Never> {
        $email
            .dropFirst(2)
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .map { email in
                let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
                let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
                print(email)
                return emailPredicate.evaluate(with: email)
            }
            .eraseToAnyPublisher()
    }
    
    private var validAgePublisher: AnyPublisher<Bool, Never> {
        $age
            .dropFirst()
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .map { age in
                let ageInt = Int(age) ?? 0
                var valid = false
                if ageInt >= 18 {
                    valid = true
                }
                return valid
            }
            .eraseToAnyPublisher()
    }
    
    private var passLengthPublisher: AnyPublisher<Bool, Never> {
        $password
            .dropFirst(2)
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .map { $0.count >= 8 }
            .eraseToAnyPublisher()
    }
    
    private var passStrengthPublisher: AnyPublisher<Bool, Never> {
        $password
            .dropFirst(2)
            .debounce(for: 0.2, scheduler: RunLoop.main)
            .map {password in self.isPasswordStrong(password: password) }
            .eraseToAnyPublisher()
    }
    
    private var validPasswordPublisher: AnyPublisher<PasswordCases, Never> {
        Publishers
            .CombineLatest(passLengthPublisher, passStrengthPublisher)
            .map { validLength, validStrength in
                if !validLength {
                    return .invalidLength
                }
                if !validStrength {
                    return .weakPassword
                }
                
                return .valid
            }
            .eraseToAnyPublisher()
    }
    
    private var validOverallPasswordPublisher: AnyPublisher<Bool, Never> {
        Publishers
            .CombineLatest3($password, $confirmPassword, validPasswordPublisher)
            .debounce(for: 0.2, scheduler: RunLoop.main)
            .map { password, confirmPassword, passwordValid in
                password == confirmPassword && (passwordValid == .valid)
            }
            .eraseToAnyPublisher()
    }
    
    private var validFormPublisher: AnyPublisher<Bool, Never> {
        Publishers
            .CombineLatest4(validFirstLastNamePublisher, validEmailPublisher, validAgePublisher, validOverallPasswordPublisher)
            .map { firstLastNameValid, emailValid, ageValid, overallPassValid in
                firstLastNameValid && emailValid && ageValid && overallPassValid
            }
            .eraseToAnyPublisher()
    }
    init() {
        validFirstNamePublisher
            .receive(on: RunLoop.main)
            .map { $0 ? "" : "Firstname must be 3 or more characters long."}
            .assign(to: \.firstNameErrorMessage, on: self)
            .store(in: &cancellable)
        
        validLastNamePublisher
            .receive(on: RunLoop.main)
            .map { $0 ? "" : "Lastname must be 3 or more characters long."}
            .assign(to: \.lastNameErrorMessage, on: self)
            .store(in: &cancellable)
        
        validAgePublisher
            .receive(on: RunLoop.main)
            .map { $0 ? "" : "You should be at least 18 years old"}
            .assign(to: \.ageErrorMessage, on: self)
            .store(in: &cancellable)
        
        validEmailPublisher
            .receive(on: RunLoop.main)
            .map { $0 ? "" : "Your email isn't correct"}
            .assign(to: \.emailErrorMessage, on: self)
            .store(in: &cancellable)
        
        validPasswordPublisher
            .receive(on: RunLoop.main)
            .map { passValidationCase in
                switch passValidationCase {
                case .invalidLength:
                    return "Password must be 8 or more characters long."
                case .weakPassword:
                    return "Password is weak. You need uppercase, lowercase letters, digits and symbols."
                default:
                    return ""
                }
            }
            .assign(to: \.passwordErrorMessage, on: self)
            .store(in: &cancellable)
        
        validOverallPasswordPublisher
            .receive(on: RunLoop.main)
            .map { $0 ? "" : "Passwords don't match."}
            .assign(to: \.confirmPasswordErrorMessage, on: self)
            .store(in: &cancellable)
        
        validFormPublisher
            .receive(on: RunLoop.main)
            .assign(to: \.isValid, on: self)
            .store(in: &cancellable)
    }
    
    func isPasswordStrong(password: String) -> Bool {
        if containsCharSet(text: password, set: .uppercaseLetters) &&
            containsCharSet(text: password, set: .lowercaseLetters) &&
            containsCharSet(text: password, set: .decimalDigits) &&
            containsCharSet(text: password, set: .alphanumerics.inverted)
        {
            return true
        }
        else {
            return false
        }
    }
    
    func containsCharSet(text : String, set: CharacterSet) -> Bool {
        if text.rangeOfCharacter(from: set) != nil{
            return true
        }
        else {
            return false
            
        }
    }
}


enum PasswordCases {
    case valid
    case invalidLength
    case weakPassword
}
