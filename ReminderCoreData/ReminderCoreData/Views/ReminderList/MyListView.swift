//
//  MyListView.swift
//  ReminderCoreData
//
//  Created by DustyTheCutie on 2023-11-14.
//

import SwiftUI

struct MyListView: View {
    
    let myLists: FetchedResults<MyList>
    
    var body: some View {
        NavigationStack{
            if myLists.isEmpty {
                Spacer()
                Text("No Reminders Found")
            }
            else{
                ForEach(myLists){myList in
                    VStack{
                        NavigationLink(value: myList) {
                            MyListCellView(myList: myList)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 10)
                                .font(.title3)
                        }
                    }.scrollContentBackground(.hidden)
                        .navigationDestination(for: MyList.self) { myList in
                            MyListDetailView(myList: myList)
                                .navigationTitle(myList.name)
                        }
                    

                    
                    
                    Divider()
                }
            }
        }
    }
}

