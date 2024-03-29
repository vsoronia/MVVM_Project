//
//  Errors.swift
//  IOS Assignment
//
//  Created by SORONIATIS Vasilis on 27/3/24.
//

import Foundation
import Alamofire

enum MyError: LocalizedError {
    case wrong(String)
    case afError(AFError)
    
    var errorDescription: String? {
        switch self {
        case .wrong(let reason):
            return "MyError: \(reason)"
        case .afError(let error):
            return "MyError: AFError: \(error.localizedDescription)"
        }
    }
}
