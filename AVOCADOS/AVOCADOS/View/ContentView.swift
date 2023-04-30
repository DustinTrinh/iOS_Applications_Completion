//
//  ContentView.swift
//  AVOCADOS
//
//  Created by DustyTheCutie on 2023-04-23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            AvocadosView()
                .tabItem({
                    Image("tabicon-branch")
                    Text("Avocados")
                })
            RecipesView()
                .tabItem({
                    Image("tabicon-book")
                    Text("Recipes")
                })
            RippeningStages()
                .tabItem({
                    Image("tabicon-avocado")
                    Text("Ripening")
                })
            SettingsView()
                .tabItem({
                    Image("tabicon-settings")
                    Text("Settings")
                })
        }
        .tint(Color.primary)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
