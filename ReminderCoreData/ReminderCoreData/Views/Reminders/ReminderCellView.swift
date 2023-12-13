//
//  ReminderCellView.swift
//  ReminderCoreData
//
//  Created by DustyTheCutie on 2023-11-26.
//

import SwiftUI

enum ReminderCellEvents {
    case onInfo
    
    case onCheckedChange(Reminder)
    
    case onSelect(Reminder)
}

struct ReminderCellView: View {
    
    let reminder: Reminder
    let isSelected: Bool
    let onEvent: (ReminderCellEvents) -> Void
    
    @State private var checkedReminder: Bool = false
    
    private func formatDate(_ date: Date) -> String {
        if date.isToday {
            return "Today"
        }
        else{
            return date.formatted(date: .numeric, time: .omitted)
        }
    }
    
    var body: some View {
        HStack {
            
            Image(systemName: reminder.isCompleted ? "circle.inset.filled" : "circle")
                .font(.title2)
                .opacity(0.4)
                .onTapGesture {
                    checkedReminder.toggle()
                    onEvent(.onCheckedChange(reminder))
                }
            
            VStack(alignment: .leading, content: {
                Text(reminder.title ?? "")
                if let notes = reminder.notes, !notes.isEmpty {
                    Text(notes)
                        .opacity(0.4)
                        .font(.caption)
                }
                
                HStack{
                    if let reminderDate = reminder.reminderDate {
                        Text(formatDate(reminderDate))
                    }
                    if let reminderTime = reminder.reminderTime {
                        Text(reminderTime.formatted(date: .omitted, time: .shortened))
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.caption)
                .opacity(0.4)
            })
            
            Spacer()
            
            Image(systemName: "info.circle.fill")
                .opacity(isSelected ? 1.0 : 0.0)
                .onTapGesture {
                    onEvent(.onInfo)
                }
        }
        .contentShape(Rectangle())
        .onTapGesture {
            onEvent(.onSelect(reminder))
        }
        .onAppear {
            checkedReminder = reminder.isCompleted
        }
    }
}

#Preview {
    ReminderCellView(reminder: PreviewData.reminder, isSelected: false, onEvent: {_ in})
        .environment(\.managedObjectContext, CoreDataProvider.shared.persistentContainer.viewContext)
}
