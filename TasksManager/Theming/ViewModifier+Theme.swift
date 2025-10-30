//
//  ViewModifier+Theme.swift
//  TasksManager
//
//  Created by Samaa Soltan on 08/10/2025.
//

import Foundation


import SwiftUI


struct ThemedButtonStyle: ViewModifier {
    let theme: Theme
    
    func body(content: Content) -> some View {
        // Your styling here
    }
}

// Extension to use them easily
extension View {
    
    func themedButton(theme: Theme) -> some View {
        modifier(ThemedButtonStyle(theme: theme))
    }
}
