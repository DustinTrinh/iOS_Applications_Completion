//
//  MyList+CoreDataClass.swift
//  ReminderCoreData
//
//  Created by DustyTheCutie on 2023-11-07.
//

import Foundation
import CoreData

@objc(MyList)
public class  MyList: NSManagedObject {
    
    var remindersArray: [Reminder]{
        reminders?.allObjects.compactMap { ($0 as! Reminder)} ?? []
    }
    
}
