//
//  ThemeManager.swift
//  TasksManager
//
//  Created by Samaa Soltan on 08/10/2025.
//

import SwiftUI

@Observable
class ThemeManager {
    // MARK: - Properties

    /// The currently selected theme mode
    /// When this changes, SwiftUI will automatically update any views using this theme
    var currentMode: ThemeMode = .terminal {
        didSet {
            updateTheme()
        }
    }
    
    /// The actual theme object that provides colors
    /// This is computed based on currentMode
    /// `private(set)` means: readable from outside, but only writable inside this class
    private(set) var current: Theme = RetroTheme()
    
    // MARK: - Initialization
    
    /// Initialize with default retro theme
    init() {
        updateTheme()
    }
    
    // MARK: - Methods
    
    /// Updates the current theme based on currentMode
    /// Call this whenever currentMode changes
    private func updateTheme() {
        switch currentMode {
        case .retro:
            current = RetroTheme()
        case .terminal:
            current = TerminalTheme()
        case .solarized:
            current = SolarizedTheme()
        }
    }
    
    /// Switches to the specified theme
    func setTheme(to mode: ThemeMode) {
        currentMode = mode
    }
    
}
