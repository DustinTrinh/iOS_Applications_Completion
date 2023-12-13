//
//  ReminderService.swift
//  ReminderCoreData
//
//  Created by DustyTheCutie on 2023-11-14.
//

import Foundation
import CoreData
import UIKit

class ReminderService {
    static var viewContext: NSManagedObjectContext {
        CoreDataProvider.shared.persistentContainer.viewContext
    }
    
    static func save() throws {
        try viewContext.save()
    }
    
    static func saveMyList(_ name: String, _ color: UIColor) throws {
        let myList = MyList(context: viewContext)
        myList.name = name
        myList.color = color
        try save()
    }
    
    static func updateReminder(reminder: Reminder, editConfig: ReminderEditConfig) throws -> Bool {
        let reminderUpdater = reminder
        reminderUpdater.title = editConfig.title
        reminderUpdater.notes = editConfig.notes
        reminderUpdater.isCompleted = editConfig.isCompleted
        reminderUpdater.reminderDate = editConfig.hasDate ? editConfig.reminderDate : nil
        reminderUpdater.reminderTime = editConfig.hasTime ? editConfig.reminderTime: nil
        
        try save()
        return true
    }
    
    static func getRemindersBySearch(searchTerm: String) -> NSFetchRequest<Reminder> {
        let request = Reminder.fetchRequest()
        request.sortDescriptors = []
        request.predicate = NSPredicate(format: "title CONTAINS[cd] %@", searchTerm)
        return request
        
    }
    
    static func saveReminderToMyList(myList: MyList, reminderTitle: String) throws {
        let reminder = Reminder(context: viewContext)
        reminder.title = reminderTitle
        myList.addToReminders(reminder)
        try save()
    }
    
    static func getRemindersByList(myList: MyList) -> NSFetchRequest<Reminder> {
        let request = Reminder.fetchRequest()
        request.sortDescriptors = []
        request.predicate = NSPredicate(format: "list = %@", myList)
        return request
    }
    
    static func deleteReminder(reminder: Reminder) throws{
        viewContext.delete(reminder)
        try save()
    }
    static func remindersByStatType(statType: ReminderStatType) -> NSFetchRequest<Reminder> {
        let request = Reminder.fetchRequest()
        request.sortDescriptors = []
        
        switch statType{
        case .all:
            request.predicate = NSPredicate(format: "isCompleted = false")
        case .today:
            let calendar = Calendar.current
            let today = calendar.startOfDay(for: Date())
            let tomorrow = calendar.date(byAdding: .day, value: 1, to: today)!
            // Assuming `reminderDate` is a Date attribute in your Reminder entity
            request.predicate = NSPredicate(format: "reminderDate >= %@ AND reminderDate < %@", today as NSDate, tomorrow as NSDate)
        case .scheduled:
            request.predicate = NSPredicate(format: "(reminderDate != nil OR reminderTime != nil)")
        case .complete:
            request.predicate = NSPredicate(format: "isCompleted = true")
        }
        return request
    }
    
    
}
