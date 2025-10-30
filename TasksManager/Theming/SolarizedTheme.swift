//
//  SolarizedTheme.swift
//  TasksManager
//
//  Created by Samaa Soltan on 08/10/2025.
//

import Foundation
import SwiftUICore


struct SolarizedTheme: Theme {
    let background = Color(red: 0.00, green: 0.17, blue: 0.21)       // #002b36 base03
    let cardBackground = Color(red: 0.03, green: 0.21, blue: 0.26)   // #073642 base02
    let border = Color(red: 0.35, green: 0.43, blue: 0.46)           // #586e75 base01
    let buttonBackground = Color(red: 0.03, green: 0.21, blue: 0.26) // #073642 base02
    let textPrimary = Color(red: 0.51, green: 0.58, blue: 0.59)      // #839496 base0
    let textSecondary = Color(red: 0.40, green: 0.48, blue: 0.51)    // #657b83 base00
    let badgeDesign = Color(red: 0.71, green: 0.54, blue: 0.00)      // #b58900 yellow
    let badgeDevelopment = Color(red: 0.15, green: 0.63, blue: 0.60) // #268bd2 blue
    let badgeContent = Color(red: 0.86, green: 0.20, blue: 0.18)     // #dc322f red
    let badgeResearch = Color(red: 0.52, green: 0.60, blue: 0.00)    // #859900 green
    let todoColor = Color(red: 0.42, green: 0.44, blue: 0.77)        // #6c71c4 violet
    let inProgressColor = Color(red: 0.15, green: 0.63, blue: 0.60)  // #268bd2 blue
    let doneColor = Color(red: 0.52, green: 0.60, blue: 0.00)        // #859900 green
    // Bottom Sheet Colors - Using Solarized base01 and base1
    let sheetBackground = Color(red: 0.03, green: 0.21, blue: 0.26)     // base02 (same as card)
    let sheetCardBackground = Color(red: 0.05, green: 0.24, blue: 0.29) // Slightly lighter
    let sheetInputBackground = Color(red: 0.07, green: 0.27, blue: 0.33) // Even lighter
    let sheetBorder = Color(red: 0.42, green: 0.44, blue: 0.77)
}
