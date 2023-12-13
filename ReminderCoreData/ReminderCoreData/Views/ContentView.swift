//
//  ContentView.swift
//  ReminderCoreData
//
//  Created by DustyTheCutie on 2023-11-07.
//

import SwiftUI

struct ContentView: View {
    
    @FetchRequest(sortDescriptors: [])
    private var myListResults: FetchedResults<MyList>
    
    @FetchRequest(sortDescriptors: [])
    private var searchResults: FetchedResults<Reminder>
    
    @FetchRequest(fetchRequest: ReminderService.remindersByStatType(statType: .all))
    private var allResults: FetchedResults<Reminder>
    
    @FetchRequest(fetchRequest: ReminderService.remindersByStatType(statType: .complete))
    private var completedResults: FetchedResults<Reminder>
    
    @FetchRequest(fetchRequest: ReminderService.remindersByStatType(statType: .scheduled))
    private var scheduledResults: FetchedResults<Reminder>
    
    @FetchRequest(fetchRequest: ReminderService.remindersByStatType(statType: .today))
    private var todayResults: FetchedResults<Reminder>
    
    private var reminderStatsBuilder = ReminderStatsBuilder()
    
    @State private var addNewList: Bool = false
    @State private var search: String = ""
    @State private var searching: Bool = false
    @State private var reminderStatsValue = ReminderStatsValue()
    
    var body: some View {
        NavigationStack{
            VStack{
                
                HStack{
                    
                    NavigationLink {
                        RemindersListView(reminders: allResults)
                    } label: {
                        RemindersStatView(icon: "tray.circle.fill", title: "All", count: reminderStatsValue.allCount, iconColor: .blue)
                    }
                    NavigationLink {
                        RemindersListView(reminders: todayResults)
                    } label: {
                        RemindersStatView(icon: "calendar", title: "Today", count: reminderStatsValue.todayCount, iconColor: .blue)
                    }
                }
                HStack{
                    NavigationLink {
                        RemindersListView(reminders: completedResults)
                    } label: {
                        RemindersStatView(icon: "checkmark.circle.fill", title: "Completed", count: reminderStatsValue.completedCount, iconColor: .blue)
                    }
                    NavigationLink {
                        RemindersListView(reminders: scheduledResults)
                    } label: {
                        RemindersStatView(icon: "calendar.circle.fill", title: "Scheduled", count: reminderStatsValue.scheduledCount, iconColor: .blue)
                    }
                }
                
                ScrollView{
                    MyListView(myLists: myListResults)
                    
                    HStack {
                        Spacer()
                        Button(action: {
                            addNewList = true
                        }, label: {
                            Text("Add New List")
                        })
                    }
                }
            }
            .padding()
            .onChange(of: search) { oldValue, newValue in
                
                searching = !newValue.isEmptyOrWhitespace
                searchResults.nsPredicate = ReminderService.getRemindersBySearch(searchTerm: search).predicate
            }
            .overlay(alignment: .center) {
                RemindersListView(reminders: searchResults)
                    .opacity(searching ? 1.0 : 0.0)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .onAppear{
                reminderStatsValue = reminderStatsBuilder.build(myListResult: myListResults)
            }
        }
        .searchable(text: $search, placement: .navigationBarDrawer(displayMode: .always))
        .textInputAutocapitalization(.never)
        .sheet(isPresented: $addNewList, content: {
            NavigationView(content: {
                AddNewListView { name, color in
                    do{
                        try ReminderService.saveMyList(name, color)
                    }catch{
                        print(error)
                    }
                }
            })
        })
        
    }
}

#Preview {
    ContentView()
        .environment(\.managedObjectContext, CoreDataProvider.shared.persistentContainer.viewContext)
}
