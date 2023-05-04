//
//  AddTodoView.swift
//  TodoList_CoreData
//
//  Created by DustyTheCutie on 2023-05-02.
//

import SwiftUI

struct AddTodoView: View {
    //MARK: - PROPERTIES
    @State private var name: String = ""
    @State private var priority: String = "Medium"
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment(\.dismiss) var dismiss
    
    @State private var errorShowing: Bool = false
    @State private var errorTitle: String = ""
    @State private var errorMsg: String = ""
    
    @ObservedObject var theme = ThemeSettings()
    var themes: [Theme] = themeData
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack(alignment: .leading, spacing: 20){
                    //MARK: - INSERT NAME
                    TextField("Todo", text: $name)
                        .padding()
                        .background(Color(UIColor.tertiarySystemFill))
                        .cornerRadius(9)
                        .font(.system(size: 24,weight: .bold, design: .none))
                    
                    //MARK: - INSERT PRIORITY
                    Picker("Priority", selection: $priority) {
                        ForEach(priorities, id: \.self){ pr in
                            Text(pr)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    //MARK: - SAVE
                    Button {
                        let todo = Todo(context: managedObjectContext)
                        if self.name == "" || self.name.isEmpty {
                            errorShowing = true
                            errorTitle = "Invalid Task"
                            errorMsg = "Please re-enter valid task."
                        }
                        else{
                            todo.name = self.name
                            todo.priority = self.priority
                            
                            do{
                                try managedObjectContext.save()
                                print("New Todo: \(todo.name ?? "") with Priority of: \(todo.priority ?? "")")
                            }
                            catch{
                                print(error)
                            }
                            
                        }
                        self.name = ""
                    } label: {
                        HStack {
                            Text("Save Task")
                                .font(.system(size: 24, weight: .bold))
                                .padding()
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .background(themes[theme.themeSettings].themeColor)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.vertical, 30)
                
                Spacer()
            }
            .navigationTitle("New Todo")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                    }

                }
            }
            .alert(isPresented: $errorShowing) {
                Alert(title: Text(errorTitle), message: Text(errorMsg), dismissButton: .default(Text("Got it!")))
            }
        }
        .tint(themes[theme.themeSettings].themeColor)
    }
}

struct AddTodoView_Previews: PreviewProvider {
    static var previews: some View {
        AddTodoView()
    }
}
