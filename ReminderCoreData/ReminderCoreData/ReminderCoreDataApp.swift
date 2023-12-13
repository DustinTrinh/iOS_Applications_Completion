//
//  ReminderCoreDataApp.swift
//  ReminderCoreData
//
//  Created by DustyTheCutie on 2023-11-07.
//

import SwiftUI
import UserNotifications

@main
struct ReminderCoreDataApp: App {
    
    init(){
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if granted{
                
            }
            else{
                
            }
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, CoreDataProvider.shared.persistentContainer.viewContext)
        }
    }
}
