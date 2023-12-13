//
//  AddNewReminder.swift
//  ReminderCoreData
//
//  Created by DustyTheCutie on 2023-11-25.
//

import SwiftUI

struct AddNewReminder: View {
    
    @Environment(\.dismiss) private var dismiss
    @State private var reminder: String = ""
    var myList: MyList
    
    var body: some View {
        VStack{
            TextField("Reminder", text: $reminder)
                .textFieldStyle(.roundedBorder)
                .padding()
            
            Button(action: {
                Task {
                    do {
                        try ReminderService.saveReminderToMyList(myList: myList, reminderTitle: reminder)
                    }
                    catch{
                        print(error.localizedDescription)
                    }
                }
                dismiss()
            }, label: {
                Text("Add Reminder")
            }).disabled(reminder.isEmptyOrWhitespace)
        }
    }
}

#Preview {
    AddNewReminder(myList: PreviewData.myList)
}
