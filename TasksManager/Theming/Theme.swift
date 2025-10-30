//
//  ViewModifier+Theme.swift
//  TasksManager
//
//  Created by Samaa Soltan on 08/10/2025.
//


import Foundation
import SwiftUICore


protocol Theme {
    var background: Color { get }
    var cardBackground: Color { get }
    var border: Color { get }
    var buttonBackground: Color { get }
    var textPrimary: Color { get }
    var textSecondary: Color { get }
    var badgeDesign: Color { get }
    var badgeDevelopment: Color { get }
    var badgeContent: Color { get }
    var badgeResearch: Color { get }
    var todoColor: Color { get }
    var inProgressColor: Color { get }
    var doneColor: Color { get }
    
    var sheetBackground: Color { get }
    var sheetCardBackground: Color { get }
    var sheetInputBackground: Color { get }
    var sheetBorder: Color { get }
    
}
