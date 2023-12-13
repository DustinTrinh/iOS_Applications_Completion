//
//  RemindersListView.swift
//  ReminderCoreData
//
//  Created by DustyTheCutie on 2023-11-25.
//

import SwiftUI

struct RemindersListView: View {
    
    @State private var selectedReminder: Reminder?
    @State private var showReminderDetail: Bool = false
    
    let reminders: FetchedResults<Reminder>
    
    private func reminderCheckedChanged(reminder: Reminder){
        var editConfig = ReminderEditConfig(reminder: reminder)
        editConfig.isCompleted = !reminder.isCompleted
        
        do{
            try ReminderService.updateReminder(reminder: reminder, editConfig: editConfig)
        }catch{
            print(error.localizedDescription)
        }
    }
    
    private func isReminderSelected(_ reminder: Reminder) -> Bool {
        return selectedReminder?.objectID == reminder.objectID
    }
    
    private func deleteReminder(_ indexSet: IndexSet){
        indexSet.forEach { index in
            let reminder = reminders[index]
            do{
                try ReminderService.deleteReminder(reminder: reminder)
            }
            catch{
                print(error.localizedDescription)
            }
        }
    }
    
    var body: some View {
        VStack{
            List{
                ForEach(reminders) {reminder in
                    ReminderCellView(reminder: reminder, isSelected: isReminderSelected(reminder)){event in
                        switch event {
                        case .onSelect(let reminder):
                            selectedReminder = reminder
                        case .onCheckedChange(let reminder):
                            reminderCheckedChanged(reminder: reminder)
                        case .onInfo:
                            showReminderDetail = true
                        }
                    }
                }
                .onDelete(perform: deleteReminder)
            }
        }
        .sheet(isPresented: $showReminderDetail, content: {
            ReminderDetailView(reminder: Binding($selectedReminder)!)
        })
    }
}

/*
 #Preview {
 RemindersListView()
 }
 */
