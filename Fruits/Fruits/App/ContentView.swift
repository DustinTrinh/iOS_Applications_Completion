//
//  ContentView.swift
//  Fruits
//
//  Created by DustyTheCutie on 2023-04-16.
//

import SwiftUI

struct ContentView: View {
    
    var fruits: [Fruit] = fruitsData
    @State private var isSettingOpen: Bool = false
    
    var body: some View {
        
        
        NavigationStack{
            
            List{
                ForEach(fruits.shuffled()) { fruit in
                    NavigationLink(destination: FruitDetailView(fruit: fruit)){
                        FruitRowView(fruit: fruit)
                            .padding(.vertical, 5)
                    }
                }
            }
            .navigationTitle("Fruits List")
            .toolbar{
                Button(action: {
                    isSettingOpen = true
                }, label: {
                    Image(systemName: "gear")
                })
                .sheet(isPresented: $isSettingOpen){
                    SettingView()
                }
            }
        }//:NAVIGATIONVIEW
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(fruits: fruitsData)
    }
}
