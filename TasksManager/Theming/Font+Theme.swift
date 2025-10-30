//
//  Font+Theme.swift
//  TasksManager
//
//  Created by Samaa Soltan on 08/10/2025.
//

import SwiftUI

extension Font {
    // MARK: - Theme Fonts (Monospaced for all themes)
    
    static let themeTitle = Font.system(size: 15, weight: .medium, design: .monospaced)
    static let themeDate = Font.system(size: 12, weight: .regular, design: .monospaced)
    static let themeBadge = Font.system(size: 11, weight: .regular, design: .monospaced)
    static let themeHeader = Font.system(size: 14, weight: .bold, design: .monospaced)
    static let themeButton = Font.system(size: 13, weight: .semibold, design: .monospaced)
    static let themeBody = Font.system(size: 14, weight: .regular, design: .monospaced)
}
