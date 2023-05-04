//
//  ThemeSetting.swift
//  TodoList_CoreData
//
//  Created by DustyTheCutie on 2023-05-04.
//

import Foundation
import SwiftUI

class ThemeSettings: ObservableObject {
    @Published var themeSettings: Int = UserDefaults.standard.integer(forKey: "Theme"){
        didSet {
            UserDefaults.standard.set(themeSettings, forKey: "Theme")
        }
    }
}
