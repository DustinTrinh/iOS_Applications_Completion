//
//  FruitsApp.swift
//  Fruits
//
//  Created by DustyTheCutie on 2023-04-16.
//

import SwiftUI

@main
struct FruitsApp: App {
    @AppStorage("isOnboarding") var isOnboarding:Bool = true
    @AppStorage("isDarkMode") private var isDarkMode = false

    var body: some Scene {
        WindowGroup {
            if isOnboarding{
                OnboardingView()
                    .preferredColorScheme(isDarkMode ? .dark : .light)
            }
            else{
                ContentView()
                    .preferredColorScheme(isDarkMode ? .dark : .light)
            }
        }
    }
}
