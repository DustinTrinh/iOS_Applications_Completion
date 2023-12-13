//
//  extension.swift
//  ReminderCoreData
//
//  Created by DustyTheCutie on 2023-11-25.
//

import Foundation
import SwiftUI

extension String {
    var isEmptyOrWhitespace: Bool { return trimmingCharacters(in: .whitespacesAndNewlines).isEmpty }
}

extension Date {
    var isToday: Bool {
        let calendar = Calendar.current
        return calendar.isDateInToday(self)
    }
    
    var isTomorrow: Bool {
        let calendar = Calendar.current
        return calendar.isDateInTomorrow(self)
    }
    
    var dateComponents: DateComponents {
        Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: self)
    }
}

extension Color {
    static let darkGray = Color(red: 27/255, green: 27/255, blue: 30/255)
    static let offWhite = Color(red: 242/255, green: 242/255, blue: 246/255)
}

