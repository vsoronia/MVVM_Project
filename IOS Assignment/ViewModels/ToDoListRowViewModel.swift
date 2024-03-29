//
//  ToDoListRowViewModel.swift
//  IOS Assignment
//
//  Created by SORONIATIS Vasilis on 12/2/24.
//

import SwiftUI

protocol ToDosListRowViewModelType {
    var user: String { get }
    var title: String { get }
    var dueOn: String { get }
    var taskStatus: Bool { get }
    func timeLeft() -> String
    func statusIsPending() -> (statusColor: Color, statusSymbol: Image)
}

class ToDosListRowViewModel: ToDosListRowViewModelType {
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
        formatter.dateFormat = .todosDateFormat
        
        guard let dueDate = formatter.date(from: dueOn) else {
            return .invalidDateFormat
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
            return .dueDatePassed
        }
    }
    
    func statusIsPending() -> (statusColor: Color, statusSymbol: Image) {
        let statusColor = taskStatus ? Color.gray : .green
        let statusSymbol = taskStatus ? ThemeManager.shared.images.todoIsPending : ThemeManager.shared.images.todoIsCompleted
        return (statusColor, statusSymbol)
    }
}
