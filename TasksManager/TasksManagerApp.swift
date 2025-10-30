//
//  TasksManagerApp.swift
//  TasksManager
//
//  Created by Samaa Soltan on 08/10/2025.
//

import SwiftUI

@main
struct TasksManagerApp: App {
    @State private var themeManager = ThemeManager()
    @State private var tasksViewModel = TasksViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(themeManager)
                .environment(tasksViewModel)
        }
        .modelContainer(for: Task.self)

    }
}
