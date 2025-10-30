//
//  FilterTab.swift
//  TasksManager
//
//  Created by Samaa Soltan on 09/10/2025.
//


//
//  FilterButton.swift
//  TasksManager
//
//  Created by Samaa Soltan on 09/10/2025.
//

import SwiftUI

struct FilterTabs: View {
    @Environment(ThemeManager.self) private var themeManager
    @Environment(TasksViewModel.self) private var tasksViewModel
   
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                ForEach(tasksViewModel.filters) { filter in
                    FilterTab(filter: filter)
                }
                
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 2)
        
    }
}


struct FilterTab: View {
    @Environment(ThemeManager.self) private var themeManager
    @Environment(TasksViewModel.self) private var tasksViewModel

    var filter: Filter
    
    var body: some View {
        HStack {
            Text("\(filter.option)")
                .textCase(.uppercase)
                .foregroundColor(themeManager.current.textPrimary)
                .bold(tasksViewModel.selectedFilter == filter.option)
                .font(tasksViewModel.selectedFilter != filter.option ? .subheadline : .headline)

            
            Text("\(filter.count)")
                .textCase(.uppercase)
                .foregroundColor(themeManager.current.textPrimary)
                .bold(tasksViewModel.selectedFilter == filter.option)
                .font(tasksViewModel.selectedFilter != filter.option ? .subheadline : .headline)
            
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 6)
        .background(themeManager.current.cardBackground)
        .overlay(
            RoundedRectangle(cornerRadius: 0)
                .stroke(themeManager.current.border, lineWidth: tasksViewModel.selectedFilter == filter.option ? 2  : 1)
        )
        .onTapGesture {
            tasksViewModel.updateFilter(to: filter.option)
        }
        
    }
}

#Preview {
    @Previewable @State var themeManager = ThemeManager()
    
    FilterTabs()
        .environment(themeManager)
}


