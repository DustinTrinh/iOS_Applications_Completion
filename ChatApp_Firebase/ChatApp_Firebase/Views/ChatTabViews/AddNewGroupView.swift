//
//  AddNewGroupView.swift
//  ChatApp_Firebase
//
//  Created by DustyTheCutie on 2023-06-21.
//

import SwiftUI

struct AddNewGroupView: View {
    @State private var groupName: String = ""
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var model: Model
    
    private var isFormValid: Bool {
        !groupName.isEmptyOrWhiteSpace
    }
    
    
    private func saveGroup() {
        let group = Group(subject: groupName)
        model.addGroup(group: group)
        dismiss()
    }
    
    var body: some View {
        NavigationStack {
            VStack{
                HStack{
                    TextField("Group's Name", text: $groupName)
                        .textFieldStyle(.roundedBorder)
                }
                Spacer()
            }
            .padding()
            .navigationTitle(Text("Add New Group"))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Create") {
                        saveGroup()
                        
                    }
                    .disabled(!isFormValid)
                }
            }
        }
    }
}

struct AddNewGroupView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewGroupView()
            .environmentObject(Model())
    }
}
