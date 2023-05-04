//
//  TodoList_CoreDataApp.swift
//  TodoList_CoreData
//
//  Created by DustyTheCutie on 2023-05-02.
//

import SwiftUI

@main
struct TodoList_CoreDataApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
