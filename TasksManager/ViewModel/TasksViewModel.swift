//
//  TasksViewModel.swift
//  TasksManager
//
//  Created by Samaa Soltan on 09/10/2025.
//

import Foundation
import SwiftUI
import SwiftData

@Observable
class TasksViewModel {
    var modelContext: ModelContext?
    
    private var tasks: [Task] = []
    
    var availableChangeToStatus: [Filter] {
        filters.filter {$0.option != selectedFilter}
    }
    
    var filters: [Filter] = [
        Filter(option: .todo, count: 4),
        Filter(option: .inProgress, count: 2),
        Filter(option: .done, count: 4),
    ]
    
    var selectedFilter: TaskStatus = .todo {
        didSet {
            filterTasks()
            updateFilterCounts()
        }
    }
    
    var filteredTasks: [Task] = []
    
    init(modelContext: ModelContext? = nil) {
        self.modelContext = modelContext
        loadTasks()
        updateFilterCounts()
        filterTasks()
    }
    
    private func filterTasks() {
        switch selectedFilter {
        case .todo:
            filteredTasks = tasks.filter { $0.status == .todo }
            break
        case .inProgress:
            filteredTasks = tasks.filter { $0.status == .inProgress }
            break
        case .done:
            filteredTasks = tasks.filter { $0.status == .done }
            break
        }
    }
    
    func updateFilter(to option: TaskStatus) {
        self.selectedFilter = option
    }
    
    func resetFilter() {
        self.selectedFilter = .todo
    }
    
    func updateFilterCounts() {
        filters = [
            Filter(option: .todo, count: tasks.filter { $0.status == .todo }.count),
            Filter(option: .inProgress, count: tasks.filter { $0.status == .inProgress }.count),
            Filter(option: .done, count: tasks.filter { $0.status == .done }.count)
        ]
    }
    
    private func refreshData() {
        loadTasks()
        updateFilterCounts()
        filterTasks()
    }
    
    
    // Load tasks from SwiftData
    func loadTasks() {
        guard let modelContext else { return }
        
        let descriptor = FetchDescriptor<Task>(
            sortBy: [SortDescriptor(\.date)]
        )
        
        do {
            tasks = try modelContext.fetch(descriptor)
        } catch {
            print("Failed to fetch tasks: \(error)")
            tasks = []
        }
        
        // If no tasks exist, create sample data
        if tasks.isEmpty {
            createSampleTasks()
        }
    }
    
    private func createSampleTasks() {
        guard let modelContext else { return }
            
        let sampleTasks = [
            Task(title: "design homepage wireframe", date: .now, category: .research),
            Task(title: "set up project repository on github", date: .now, category: .development, status: .done),
            Task(title: "wire user onboarding email copy", date: .now, category: .documentation, status: .inProgress)
        ]
            
        for task in sampleTasks {
            modelContext.insert(task)
        }
            
        try? modelContext.save()
        loadTasks()
    }
       
    
    func addTask(newTask: Task) {
        guard let modelContext else { return }
        
        modelContext.insert(newTask);
        try? modelContext.save()
        
        refreshData()
    }
    
    func deleteTask(indexSet: IndexSet) {
        guard let modelContext else { return }
    
        guard let index = indexSet.first else { return }
        
        let taskToDelete = tasks[index]
        
        modelContext.delete(taskToDelete)
        try? modelContext.save()
        
        refreshData()
    }
    
    
    func updateTaskStatus(taskToUpdate: Task, newStatus: TaskStatus) {
        guard let modelContext else { return }
        taskToUpdate.status = newStatus
        
        try? modelContext.save()
        
        refreshData()
    }
    
    
}
