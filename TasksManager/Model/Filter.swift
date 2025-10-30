//
//  Filter.swift
//  TasksManager
//
//  Created by Samaa Soltan on 09/10/2025.
//

import Foundation


struct Filter: Identifiable {
    var id: UUID = UUID()
    var option: TaskStatus = .todo
    var count: Int = 0
}

