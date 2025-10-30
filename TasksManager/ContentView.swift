//
//  ContentView.swift
//  TasksManager
//
//  Created by Samaa Soltan on 08/10/2025.
//

import SwiftUI

struct ContentView: View {
    @Environment(ThemeManager.self) private var themeManager
    @Environment(TasksViewModel.self) private var tasksViewModel
    @Environment(\.modelContext) private var modelContext
    
    @State private var showAddTaskSheet = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                themeManager.current.background
                    .ignoresSafeArea()
                
                VStack {
                    FilterTabs()
                        .padding(.bottom, 20)
                    
                    List {
                        ForEach(tasksViewModel.filteredTasks) { task in
                            TaskCard(task: task)
                                .listRowBackground(Color.clear)
                                .listRowSeparator(.hidden)
                                .listRowInsets(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                                .padding(.bottom, 12)
                                .contextMenu {
                                    ChangeStatusMenu(task: task)
                                }
                        }
                        .onDelete { indexSet in
                            tasksViewModel.deleteTask(indexSet: indexSet)
                        }
                        
                    }
                    .listStyle(.plain)
                    .scrollContentBackground(.hidden)
                    
                }
            }
            
        }
        .navigationTitle(Text("Tasks"))
        .safeAreaInset(edge: .bottom) {
            
            HStack {
                Spacer()
                
                Button(action: {
                    showAddTaskSheet = true
                    
                }) {
                    
                    Image(systemName: "plus")
                        .foregroundColor(themeManager.current.textPrimary)
                        .font(.title2)
                }
                .buttonStyle(.bordered)
                .padding()
            }
            
        }
        .sheet(isPresented: $showAddTaskSheet) {
            AddTaskSheet()
                .presentationDetents([.fraction(0.63), .fraction(0.85)])
                .presentationDragIndicator(.visible)
        }
        .onAppear {
            // Set modelContext when view appears
            if tasksViewModel.modelContext == nil {
                tasksViewModel.modelContext = modelContext
                tasksViewModel.loadTasks()
                tasksViewModel.updateFilterCounts()
                tasksViewModel.resetFilter()
            }
        }
    }
}

#Preview {
    @Previewable @State var themeManager = ThemeManager()
    @Previewable @State var tasksViewModel = TasksViewModel()
    
    ContentView()
        .environment(themeManager)
        .environment(tasksViewModel)
        .modelContainer(for: Task.self, inMemory: true)
}



struct ChangeStatusMenu: View {
    @Environment(TasksViewModel.self) private var tasksViewModel
    var task: Task

    var body: some View {
        ForEach(tasksViewModel.availableChangeToStatus) { status in
            
            Button("\(status.option.rawValue)") {
                tasksViewModel.updateTaskStatus(taskToUpdate: task, newStatus: status.option)
            }
             
            
        }
    }
}
