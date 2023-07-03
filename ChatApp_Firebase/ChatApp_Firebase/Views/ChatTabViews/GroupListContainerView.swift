//
//  GroupListContainerView.swift
//  ChatApp_Firebase
//
//  Created by DustyTheCutie on 2023-06-21.
//

import SwiftUI

struct GroupListContainerView: View {
    @State private var isPresented: Bool = false
    @EnvironmentObject private var model: Model
    
    var body: some View {
        VStack{
            HStack{
                Spacer()
                
                Button {
                    isPresented = true
                } label: {
                    HStack{
                        Image(systemName: "plus")
                        Text("New Group")
                    }
                }
            }
            
            GroupListView(groups: model.groups)
            
            Spacer()
            
        }
        .refreshable {
            do {
              try await model.fetchGroups()
            }
            catch{
                print(error)
            }
        }
        .task {
            do {
              try await model.fetchGroups()
            }
            catch{
                print(error)
            }
        }
        .padding()
        .sheet(isPresented: $isPresented) {
            AddNewGroupView()
        }
        
    }
}

struct GroupListContainerView_Previews: PreviewProvider {
    static var previews: some View {
        GroupListContainerView()
            .environmentObject(Model())
    }
}
