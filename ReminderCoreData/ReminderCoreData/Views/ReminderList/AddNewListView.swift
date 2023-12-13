//
//  AddNewListView.swift
//  ReminderCoreData
//
//  Created by DustyTheCutie on 2023-11-07.
//

import SwiftUI

struct AddNewListView: View {
    
    @Environment(\.dismiss) private var dismiss
    @State private var listName: String = ""
    @State private var selectedColor: Color = .red
    
    let onSave: (String, UIColor) -> Void
    
    private var isFormValid: Bool {
        !listName.isEmpty
    }
    
    var body: some View {
        VStack{
            
            VStack{
                Image(systemName: "line.3.horizontal.circle.fill")
                    .foregroundStyle(selectedColor)
                    .font(.system(size: 100))
                    
                
                TextField("List Name", text: $listName)
                    .multilineTextAlignment(.center)
                    .textFieldStyle(.roundedBorder)
            }
            .padding(30)
            //.clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            
            ColorPickerView(selectedColor: $selectedColor)
            Spacer()
            
           
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .toolbar{
            ToolbarItem(placement: .principal) {
                Text("New List")
                    .font(.headline)
            }
            
            ToolbarItem(placement: .topBarLeading) {
                Button(action: {
                    dismiss()
                }, label: {
                    Text("Close")
                })
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {
                    
                    onSave(listName, UIColor(selectedColor))
                    dismiss()
                }, label: {
                    Text("Done")
                }).disabled(listName.isEmptyOrWhitespace)
            }
        }
    }
}

#Preview {
    NavigationView{
        AddNewListView(onSave: { (_, _) in })
    }
    
}
