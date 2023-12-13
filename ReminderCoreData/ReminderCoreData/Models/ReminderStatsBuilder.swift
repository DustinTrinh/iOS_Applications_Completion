//
//  ReminderStatsBuilder.swift
//  ReminderCoreData
//
//  Created by DustyTheCutie on 2023-12-03.
//

import Foundation
import CoreData
import SwiftUI

enum ReminderStatType {
    case today
    case all
    case scheduled
    case complete
}
struct ReminderStatsValue {
    var todayCount: Int = 0
    var scheduledCount: Int = 0
    var allCount: Int = 0
    var completedCount: Int = 0
}

struct ReminderStatsBuilder {
    
    func build(myListResult: FetchedResults<MyList>) -> ReminderStatsValue {
        let remindersArray = myListResult.map {
            
            $0.remindersArray
            
        }.reduce([], +)
        
        let completedCount = calculateCompletedCount(reminders: remindersArray)
        let allCount = calculateAllCount(reminders: remindersArray)
        let todaysCount = calculateTodaysCount(reminders: remindersArray)
        let scehduledCount = calculateScheduledCount(reminders: remindersArray)
        return ReminderStatsValue(todayCount: todaysCount, scheduledCount: scehduledCount, allCount: allCount, completedCount: completedCount)
    }
    
    private func calculateAllCount(reminders: [Reminder]) -> Int {
        return reminders.reduce(0) { result, reminder in
            return !reminder.isCompleted ? result + 1 : result
        }
    }
    
    private func calculateCompletedCount(reminders: [Reminder]) -> Int {
        return reminders.reduce(0) { result, reminder in
            return reminder.isCompleted ? result + 1 : result
        }
    }
    
    private func calculateTodaysCount(reminders: [Reminder]) -> Int {
        return reminders.reduce(0) { result, reminder in
            let isToday = reminder.reminderDate?.isToday ?? false
            return isToday ? result + 1 : result
        }
    }
    
    private func calculateScheduledCount(reminders: [Reminder]) -> Int {
        return reminders.reduce(0) { result, reminder in
            return (reminder.reminderDate != nil || reminder.reminderTime != nil) && !reminder.isCompleted ? result + 1 : result
        }
    }
}
