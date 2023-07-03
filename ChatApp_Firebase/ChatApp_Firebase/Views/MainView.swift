//
//  MainView.swift
//  ChatApp_Firebase
//
//  Created by DustyTheCutie on 2023-06-17.
//

import SwiftUI
import FirebaseAuth

struct MainView: View {

    
    var body: some View {
        TabView {
            GroupListContainerView()
                .tabItem {
                    Label("Chats", systemImage: "message.fill")
                }
            
            SettingsTabView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
            
        }
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            
    }
}
