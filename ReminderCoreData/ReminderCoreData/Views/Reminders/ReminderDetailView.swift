//
//  ReminderDetailView.swift
//  ReminderCoreData
//
//  Created by DustyTheCutie on 2023-11-26.
//

import SwiftUI

struct ReminderDetailView: View {
    
    @Environment(\.dismiss) private var dismiss
    @Binding var reminder: Reminder
    @State private var editConfig: ReminderEditConfig = ReminderEditConfig()
    
    var body: some View {
        NavigationStack {
            VStack{
                List{
                    Section{
                        TextField("Title", text: $editConfig.title)
                        TextField("Notes", text: $editConfig.notes ?? "")
                    }
                    
                    Section{
                        Toggle(isOn: $editConfig.hasDate, label: {
                            Image(systemName: "calendar")
                                .foregroundStyle(.red)
                        })
                        
                        if editConfig.hasDate {
                            DatePicker("Select Date", selection: $editConfig.reminderDate ?? Date(), displayedComponents: .date)
                        }
                        
                        Toggle(isOn: $editConfig.hasTime, label: {
                            Image(systemName: "clock")
                                .foregroundStyle(.blue)
                        })
                        
                        if editConfig.hasTime {
                            DatePicker("Select Time", selection: $editConfig.reminderTime ?? Date(), displayedComponents: .hourAndMinute)
                        }
                    }
                    .onChange(of: editConfig.hasDate) {
                        if editConfig.hasDate {
                            editConfig.reminderDate = Date()
                        }
                    }
                    .onChange(of: editConfig.hasTime) {
                        if editConfig.hasTime {
                            editConfig.reminderTime = Date()
                        }
                    }
                    
                    Section{
                        NavigationLink {
                            SelectListView(selectedList: $reminder.list)
                        } label: {
                            HStack {
                                Text("List")
                                Spacer()
                                Text(reminder.list?.name ?? "No List")
                            }
                            
                        }
                        
                    }
                }
                .listStyle(.insetGrouped)
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Details")
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") {
                        do {
                            let updated = try ReminderService.updateReminder(reminder: reminder, editConfig: editConfig)
                            if updated {
                                if reminder.reminderDate != nil || reminder.reminderTime != nil {
                                    let userData = UserData(title: reminder.title, body: reminder.notes, date: reminder.reminderDate, time: reminder.reminderTime)
                                    NotificationManager.scheduleNotification(userData: userData)
                                }
                            }
                        }
                        catch{
                            print(error.localizedDescription)
                        }
                        dismiss()
                    }.disabled(editConfig.title.isEmptyOrWhitespace)
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
        
        .onAppear {
            editConfig = ReminderEditConfig(reminder: reminder)
        }
        
    }
}

#Preview {
    ReminderDetailView(reminder: .constant(PreviewData.reminder))
        .environment(\.managedObjectContext, CoreDataProvider.shared.persistentContainer.viewContext)
}
