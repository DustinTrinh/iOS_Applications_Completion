//
//  SelectListView.swift
//  ReminderCoreData
//
//  Created by DustyTheCutie on 2023-11-27.
//

import SwiftUI

struct SelectListView: View {
    
    @FetchRequest(sortDescriptors: [])
    private var myListFetchResults: FetchedResults<MyList>
    @Binding var selectedList: MyList?
    
    
    var body: some View {
        List(myListFetchResults){myList in
            HStack {
                HStack{
                    Image(systemName: "line.3.horizontal.circle.fill")
                        .foregroundStyle(Color(myList.color))
                    Text(myList.name)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .contentShape(Rectangle())
                .onTapGesture {
                    self.selectedList = myList
                }
                
                Spacer()
                
                if selectedList == myList {
                    Image(systemName: "checkmark")
                }
            }
        }
    }
}

#Preview {
    SelectListView(selectedList: .constant(PreviewData.myList))
        .environment(\.managedObjectContext, CoreDataProvider.shared.persistentContainer.viewContext)
}
