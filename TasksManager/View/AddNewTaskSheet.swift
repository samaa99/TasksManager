//
//  AddNewTaskSheet.swift
//  TasksManager
//
//  Created by Samaa Soltan on 13/10/2025.
//

import SwiftUI

//struct AddTaskSheet: View {
//    @Environment(ThemeManager.self) private var themeManager
//    @Environment(TasksViewModel.self) private var tasksViewModel
//    @Environment(\.dismiss) private var dismiss
//    
//    @State private var title: String = ""
//    @State private var selectedDate: Date = .now
//    @State private var selectedCategory: TaskCategory = .research
//    @State private var selectedStatus: TaskStatus = .todo
//    
//    var body: some View {
//        ZStack {
//            themeManager.current.textSecondary
//                .ignoresSafeArea()
//            
//            VStack {
//                Text("NEW TASK")
//            }
//        }
//    }
//}

struct AddTaskSheet: View {
    @Environment(ThemeManager.self) private var themeManager
    @Environment(TasksViewModel.self) private var tasksViewModel
    @Environment(\.dismiss) private var dismiss
    
    @State private var title: String = ""
    @State private var selectedDate: Date = .now
    @State private var selectedCategory: TaskCategory = .research
    @State private var selectedStatus: TaskStatus = .todo

    
    var body: some View {
        ZStack {
            // Use sheet background
            themeManager.current.sheetBackground
                .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 24) {
                    // Title Input
                    VStack(alignment: .leading, spacing: 8) {
                        Text("TASK TITLE")
                            .font(.caption)
                            .foregroundColor(themeManager.current.textPrimary)
                        
                        TextField("Enter task title", text: $title)
                            .textFieldStyle(.plain)
                            .padding()
                            .foregroundColor(themeManager.current.textPrimary)
                            .font(.themeBody)
                            .accentColor(themeManager.current.textPrimary)
                            .background(themeManager.current.sheetInputBackground)
                            .cornerRadius(8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(themeManager.current.sheetBorder, lineWidth: 1)
                            )
                            
                    }
                    
                    // Date Picker
                    VStack(alignment: .leading, spacing: 8) {
                        Text("DUE DATE")
                            .font(.caption)
                            .foregroundColor(themeManager.current.textPrimary)
                        
                        DatePicker(
                            "",
                            selection: $selectedDate,
                            displayedComponents: [.date]
                        )
                        .datePickerStyle(.compact)
                        .labelsHidden()
                        .frame(maxWidth: .infinity, alignment: .leading) 
                        .padding()
                        .background(themeManager.current.sheetCardBackground)
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(themeManager.current.sheetBorder, lineWidth: 1) 
                        )
                        .colorScheme(.dark)
                    }
                    
                    // Category Picker
                    VStack(alignment: .leading, spacing: 8) {
                        Text("CATEGORY")
                            .font(.caption)
                            .foregroundColor(themeManager.current.textPrimary)
                        
                        CustomSegmentedPicker(
                            options: [
                                ("RESEARCH", TaskCategory.research),
                                ("DEV", TaskCategory.development),
                                ("DOCS", TaskCategory.documentation)
                            ],
                            selection: $selectedCategory
                        )
                    }

                    // Status Picker
                    VStack(alignment: .leading, spacing: 8) {
                        Text("STATUS")
                            .font(.caption)
                            .foregroundColor(themeManager.current.textPrimary)
                        
                        CustomSegmentedPicker(
                            options: [
                                ("TODO", TaskStatus.todo),
                                ("IN PROGRESS", TaskStatus.inProgress),
                                ("DONE", TaskStatus.done)
                            ],
                            selection: $selectedStatus
                        )
                    }
                    .padding(.bottom, 12)

                    
                    
                    // Add Button
                    Button(action: addTask) {
                        Text("ADD TASK")
                            .font(.themeButton)
                            .foregroundColor(themeManager.current.textPrimary)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(themeManager.current.buttonBackground)
                            .cornerRadius(8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(themeManager.current.sheetBorder, lineWidth: 1)
                            )
                    }
                    .disabled(title.trimmingCharacters(in: .whitespaces).isEmpty)
                    .opacity(title.trimmingCharacters(in: .whitespaces).isEmpty ? 0.5 : 1.0)
                }
                .padding()
            }
        }
    }
    
    private func addTask() {
        let trimmedTitle = title.trimmingCharacters(in: .whitespaces)
        guard !trimmedTitle.isEmpty else { return }
        
        tasksViewModel.addTask(newTask: Task(
            title: trimmedTitle,
            date: selectedDate,
            category: selectedCategory,
            status: selectedStatus
        ))
        
        dismiss()
    }
}

#Preview {
    @Previewable @State var themeManager = ThemeManager()
    @Previewable @State var tasksViewModel = TasksViewModel()
    
    AddTaskSheet()
        .environment(themeManager)
        .environment(tasksViewModel)
}


// Add this new view in AddTaskSheet.swift or separate file
struct CustomSegmentedPicker<T: Hashable>: View {
    @Environment(ThemeManager.self) private var themeManager
    
    let options: [(label: String, value: T)]
    @Binding var selection: T
    
    var body: some View {
        HStack(spacing: 4) {
            ForEach(options, id: \.value) { option in
                SegmentButton(
                    label: option.label,
                    isSelected: selection == option.value,
                    action: {
                        withAnimation(.bouncy) {
                            selection = option.value
                        }
                    }
                )
            }
        }
        .padding(4)
        .background(themeManager.current.sheetCardBackground)
        .cornerRadius(8)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(themeManager.current.sheetBorder, lineWidth: 1)
        )
    }
}

// Break the button into a separate view
private struct SegmentButton: View {
    @Environment(ThemeManager.self) private var themeManager
    
    let label: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(label)
                .font(.caption)
                .foregroundColor(themeManager.current.textPrimary)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 8)
                .background(isSelected ? themeManager.current.buttonBackground : themeManager.current.sheetCardBackground)
                .cornerRadius(6)
        }
    }
}
