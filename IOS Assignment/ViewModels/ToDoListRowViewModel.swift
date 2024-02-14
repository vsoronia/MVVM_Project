//
//  ToDoListRowViewModel.swift
//  IOS Assignment
//
//  Created by SORONIATIS Vasilis on 12/2/24.
//

import SwiftUI

class ToDosListRowViewModel {
    let user: String
    let title: String
    let dueOn: String
    let taskStatus: Bool
    
    init(user: String, title: String, dueOn: String, taskStatus: Bool) {
        self.user = user
        self.title = title
        self.dueOn = dueOn
        self.taskStatus = taskStatus
    }
    
    func timeLeft() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        
        guard let dueDate = formatter.date(from: dueOn) else {
            return "Invalid date format"
        }
        
        let currentDateTime = Date()
        let diffComponents = Calendar.current.dateComponents([.day, .hour, .minute], from: currentDateTime, to: dueDate)
        
        
        if let diffDay = diffComponents.day, diffDay > 0 {
            return "\(diffDay) days left"
        } else if  let diffHour = diffComponents.hour, diffHour > 0 {
            return "\(diffHour) hours left"
        } else if let diffMinute = diffComponents.minute, diffMinute > 0 {
            return "\(diffMinute) minutes left"
        } else {
            return "Due date passed"
        }
    }
    
    func statusIsPending() -> (statusColor: Color, statusSymbol: String) {
        let statusColor = taskStatus ? Color.gray : .green
        let statusSymbol = taskStatus ? "ellipsis.circle" : "checkmark.circle"
        return (statusColor, statusSymbol)
    }
}
