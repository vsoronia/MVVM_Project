//
//  File.swift
//  IOS Assignment
//
//  Created by SORONIATIS Vasilis on 12/3/24.
//

import Foundation
import SwiftUI

extension String {
    
    //SignUp View
    static let placeholderFirstName = "placeholder_first_name".localized(comments: "Firstname of the user")
    static let placeholderLastName = "placeholder_last_name".localized(comments: "Lastname of the user")
    static let placeholderEmail = "placeholder_email".localized(comments: "User's email")
    static let placeholderAge = "placeholder_age".localized(comments: "User's age")
    static let placeholderPassword = "placeholder_password".localized(comments: "User's password")
    static let placeholderConfirmPassword = "placeholder_confirm_password".localized(comments: "Rewrite the Password")
    static let signUp = "sign_up".localized(comments: "Sign Up button title")
    static let errorFirstNameLength = "error_first_name_length".localized(comments: "Error message for first name length")
    static let errorLastNameLength = "error_last_name_length".localized(comments: "Error message for last name length")
    static let errorAge = "error_age".localized(comments: "Error message for age requirement")
    static let errorEmail = "error_email".localized(comments: "Error message for incorrect email")
    static let lengthErrorPassword = "length_error_password".localized(comments: "Error message for password length")
    static let weakErrorPassword = "weak_error_password".localized(comments: "Error message for weak password")
    static let errorConfirmPassword = "error_confirm_password".localized(comments: "Error message for password mismatch")
    static let signUpFormTitle = "signup_form_title".localized(comments: "Title: SignUp Form")
    
    //AboutUs View
    static let aboutTheApp = "about_the_app".localized(comments: "Header: About the App")
    static let copyrightMessage = "copyright_message".localized(comments: "Footer: Copyright message")
    static let application = "application".localized(comments: "Row label: Application")
    static let todosApp = "todos_app".localized(comments: "Row content: TODOs App")
    static let compatibility = "compatibility".localized(comments: "Row label: Compatibility")
    static let miniOSVersion = "min_ios_version".localized(comments: "Row content: min iOS 16")
    static let technology = "technology".localized(comments: "Row label: Technology")
    static let swiftUI = "swift_ui".localized(comments: "Row content: SwiftUI")
    static let version = "version".localized(comments: "Row label: Version")
    static let appVersion = "app_version".localized(comments: "Row content: 1.0")
    static let developer = "developer".localized(comments: "Row label: Developer")
    static let developerName = "developer_name".localized(comments: "Row content: Vsoro")
    static let designer = "designer".localized(comments: "Row label: Designer")
    static let designerName = "designer_name".localized(comments: "Row content: Vsoro")
    static let facebook = "facebook".localized(comments: "Row label: Facebook")
    static let instagram = "instagram".localized(comments: "Row label: Instagram")
    static let contactAndSupport = "contact_and_support".localized(comments: "Row label: Contact & Support")
    static let contactEmail = "contact_email".localized(comments: "Row content: vsoro@example.com")
    static let todos = "todos".localized(comments: "Link label: TODOs")
    
    //UserDetails View
    static let userPostsButton = "user_posts_button".localized(comments: "Button that shows all posts of this user")
    static let userCommentsButton = "user_comments_button".localized(comments: "Button that shows all comments of this user")
    static let userTodosButton = "user_todos_button".localized(comments: "Button that shows all Todos of this user")
    static let userButton = "user_todos_button".localized(comments: "Button that shows all Todos of this user")
    static let userDeleteButton = "user_delete_button".localized(comments: "Button to delete this user")
    static let userDeleteAlertMessage = "delete_user_alert_message".localized(comments: "")
    static let userDeleteConfirm = "user_delete_confirm".localized(comments: "")
    static let userDeleteCancel = "user_delete_cancel".localized(comments: "")
    
    //User List Row View
    static let accessibilityActiveUser = "accessibility_active_user".localized(comments: "")
    static let accessibilityInactiveUser = "accessibility_inactive_user".localized(comments: "")

    //UserPosts View
    static let userWithNoPosts = "user_no_posts".localized(comments: "This user hasn't posts yet")

    //UserComments View
    static let userWithNoComments = "user_no_comments".localized(comments: "This user hasn't posts yet")

    //UserTodos View
    static let userWithNoTodos = "user_no_todos".localized(comments: "This user hasn't todos yet")
    
    //Todo List Row View Model
    static let todosDateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    static let invalidDateFormat = "invalid_date_format".localized(comments: "")
    static let dueDatePassed = "due_date_passed".localized(comments: "")
    
    
    // Token networking service
    static let authName = "Authorization"
    static let token = "Bearer 467023bee0ee5846310c1bd1f75de70052a92cae617aea1190dd296a17bcb728"



    func localized(_ tableName: String = "Localizable", comments: String) -> String {
        return NSLocalizedString(
            self,
            tableName: tableName,
            bundle: Bundle.main,
            value: "\(self)",
            comment: comments
        )
    }
}

public class StringUtils {
    public static func emailPredicate() -> NSPredicate {
        return NSPredicate(format:"SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
    }
}
