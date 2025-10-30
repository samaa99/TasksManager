//
//  TaskCard.swift
//  TasksManager
//
//  Created by Samaa Soltan on 08/10/2025.
//

import SwiftUI

struct TaskCard: View {
    @Environment(ThemeManager.self) private var themeManager
    var task: Task
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(task.title)
                .textCase(.uppercase)
                .font(.themeTitle)
                .foregroundStyle(themeManager.current.textPrimary)
                .padding(.bottom, 24)
            
            HStack {
                Text(task.date, format: .dateTime.month(.wide).day().year())
                    .textCase(.uppercase)
                    .font(.themeDate)
                    .foregroundStyle(themeManager.current.textSecondary)
                
                Spacer()
                
                HStack {
                    Text("#\(task.status)")
                        .textCase(.uppercase)
                        .font(.themeBadge)
                        .foregroundColor(themeManager.current.textPrimary)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .cornerRadius(4)
                        .overlay(
                            RoundedRectangle(cornerRadius: 4)
                                .stroke(themeManager.current.border, lineWidth: 1)
                        )
                    
                    
                    Text("#\(task.category)")
                        .textCase(.uppercase)
                        .font(.themeBadge)
                        .foregroundColor(themeManager.current.textPrimary)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .cornerRadius(4)
                        .overlay(
                            RoundedRectangle(cornerRadius: 4)
                                .stroke(themeManager.current.border, lineWidth: 1)
                        )
                    
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(themeManager.current.cardBackground)
        .cornerRadius(8)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(themeManager.current.border, lineWidth: 1)
        )
    }
}

#Preview {
    @Previewable @State var themeManager = ThemeManager()
    @Previewable var task = Task(title: "TODO", date: .now, category: .documentation)
    
    TaskCard(task: task)
        .environment(themeManager)
}
