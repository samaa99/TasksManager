//
//  Task.swift
//  TasksManager
//
//  Created by Samaa Soltan on 08/10/2025.
//

import Foundation
import SwiftData

@Model
class Task: Identifiable {
    var title: String
    var date: Date
    var status: TaskStatus
    var category: TaskCategory
    
    init(title: String, date: Date, category: TaskCategory, status: TaskStatus = .todo) {
        self.title = title
        self.date = date
        self.category = category
        self.status = status
    }
    
}


enum TaskStatus: String, Codable {
    case todo
    case inProgress
    case done
}


enum TaskCategory: String, Codable {
    case research
    case development
    case documentation
}
