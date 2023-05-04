//
//  ContentView.swift
//  TodoList_CoreData
//
//  Created by DustyTheCutie on 2023-05-02.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @State private var showingAddTodo: Bool = false
    @State private var showingSetting: Bool = false
    @State private var animatingButton: Bool = false
    
    @FetchRequest(entity: Todo.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Todo.name, ascending: true)]) var todos: FetchedResults<Todo>
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
var body: some View {
    //MARK: - PROPERTIES
    @ObservedObject var theme = ThemeSettings()
    var themes: [Theme] = themeData
    
    NavigationStack {
        ZStack {
            List{
                ForEach(todos, id: \.self){ task in
                    HStack{
                        Circle()
                            .frame(width: 12, height: 12, alignment: .center)
                            .foregroundColor(colorizeTask(priority: task.priority ?? "Normal"))
                            Text(task.name ?? "Unknown")
                            .fontWeight(.semibold)
                            Spacer()
                            Text(task.priority ?? "Unknown")
                            .font(.footnote)
                            .foregroundColor(Color(UIColor.systemGray2))
                            .padding(3)
                            .frame(minWidth: 62)
                            .overlay(
                                Capsule().stroke(Color(UIColor.systemGray2), lineWidth: 0.75)
                            )
                    }
                    .padding(.vertical)
                    }
                .onDelete(perform: deleteTask)
                }
                .navigationTitle("Todo")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        EditButton()
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            showingSetting.toggle()
                        } label: {
                            Image(systemName: "paintbrush.pointed.fill")
                        }
                        .sheet(isPresented: $showingSetting) {
                            SettingsView()
                        }

                    }
            }
            
            //MARK: - Empty Todo
            if(todos.count == 0){
                EmptyTodoView()
            }
        }
        .sheet(isPresented: $showingAddTodo) {
            AddTodoView()
                .environment(\.managedObjectContext, managedObjectContext)
        }
        .overlay(
            ZStack {
                Group{
                    Circle()
                        .fill(themes[theme.themeSettings].themeColor)
                        .opacity(animatingButton ?  0.3 : 0)
                        .scaleEffect(animatingButton ? 1 : 0)
                        .frame(width: 68, height: 68, alignment: .center)
                    Circle()
                        .fill(themes[theme.themeSettings].themeColor)
                        .opacity(animatingButton ? 0.15 : 0)
                        .scaleEffect(animatingButton ? 1 : 0)
                        .frame(width: 88, height: 88, alignment: .center)
                }
                //.animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true), value: animatingButton)
                
                Button(action: {
                    showingAddTodo.toggle()
                }, label: {
                    VStack {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .scaledToFit()
                        .frame(width: 48, height: 48, alignment: .center)
                    }
                })
            }
                .onAppear {
                    animatingButton.toggle()
                }
                .padding(.bottom, 15)
                .padding(.trailing, 15)
            , alignment: .bottomTrailing
                
        )
    }
    .tint(themes[theme.themeSettings].themeColor)
    
}
    
//MARK: - FUNCTIONS
    private func colorizeTask(priority: String) -> Color{
        switch priority{
        case "High":
            return .pink
        case "Medium":
            return .blue
        case "Low":
            return .green
        default:
            return .gray
        }
    }
    
    private func deleteTask(at offsets: IndexSet){
        for index in offsets{
            let todo = todos[index]
            managedObjectContext.delete(todo)
            
            do{
                try managedObjectContext.save()
            }catch{
                print(error)
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            let persistenceController = PersistenceController.shared
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
