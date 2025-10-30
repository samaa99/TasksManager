//
//  TerminalTheme.swift
//  TasksManager
//
//  Created by Samaa Soltan on 08/10/2025.
//

import Foundation
import SwiftUICore


struct TerminalTheme: Theme {
    let background = Color.black
    let cardBackground = Color(white: 0.15)
    let border = Color.white
    let buttonBackground = Color(white: 0.25)
    let textPrimary = Color.white
    let textSecondary = Color(white: 0.70)
    let badgeDesign = Color(white: 0.85)
    let badgeDevelopment = Color(white: 0.75)
    let badgeContent = Color(white: 0.65)
    let badgeResearch = Color(white: 0.55)
    let todoColor = Color(white: 0.30)
    let inProgressColor = Color(white: 0.50)
    let doneColor = Color(white: 0.70)
    let sheetBackground = Color(white: 0.12)       // Slightly lighter than main bg
    let sheetCardBackground = Color(white: 0.20)   // Medium gray
    let sheetInputBackground = Color(white: 0.25)  // Light gray for inputs
    let sheetBorder = Color(white: 0.85)           // Light border
}
