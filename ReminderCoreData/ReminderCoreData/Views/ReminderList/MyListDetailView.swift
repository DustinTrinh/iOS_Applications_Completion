//
//  MyListDetailView.swift
//  ReminderCoreData
//
//  Created by DustyTheCutie on 2023-11-25.
//

import SwiftUI

struct MyListDetailView: View {
    
    let myList: MyList
    @State private var openAddReminder: Bool = false
    @FetchRequest(sortDescriptors: [])
    private var reminderResults: FetchedResults<Reminder>
    
    init(myList: MyList){
        self.myList = myList
        _reminderResults = FetchRequest(fetchRequest: ReminderService.getRemindersByList(myList: myList))
    }
    
    var body: some View {
        VStack{
            RemindersListView(reminders: reminderResults)
            HStack{
                Button(action: {
                    openAddReminder = true
                }, label: {
                    HStack{
                        Image(systemName: "plus.circle.fill")
                        Text("New Reminder")
                    }
                })
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
        }
        .sheet(isPresented: $openAddReminder, content: {
            AddNewReminder(myList: myList)
                .presentationDetents([.fraction(0.55)])
        })
    }
}

#Preview {
    MyListDetailView(myList: PreviewData.myList)
}
