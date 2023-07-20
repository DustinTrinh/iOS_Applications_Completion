//
//  ContentView.swift
//  MovieBooking
//
//  Created by DustyTheCutie on 2023-07-19.
//

import SwiftUI

struct ContentView: View {
    
    @State var currentTab: Tab = .home
    
    var body: some View {
        NavigationView {
            VStack(spacing:0) {
                TabView(selection: $currentTab) {
                    HomeView()
                        .tag(Tab.home)
                    
                    Text("Location")
                        .tag(Tab.location)
                    
                    TicketView()
                        .tag(Tab.ticket)
                    
                    Text("Category")
                        .tag(Tab.category)
                    
                    Text("Profile")
                        .tag(Tab.profile)
                }
                
                CustomTabBar(currentTab: $currentTab)
            }
            .ignoresSafeArea(.keyboard)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
