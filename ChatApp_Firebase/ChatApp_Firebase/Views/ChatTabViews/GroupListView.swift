//
//  GroupListView.swift
//  ChatApp_Firebase
//
//  Created by DustyTheCutie on 2023-06-22.
//

import SwiftUI

struct GroupListView: View {
    
    let groups: [Group]
    @EnvironmentObject private var model: Model
    
    var body: some View {
        List(groups) { group in
            NavigationLink {
                GroupDetailView(group: group)
            }label: {
                HStack{
                    Image(systemName: "person.2")
                    Text(group.subject)
                }
            }
        }
    }
}

struct GroupListView_Previews: PreviewProvider {
    static var previews: some View {
        GroupListView(groups: [])
            .environmentObject(Model())
    }
}
