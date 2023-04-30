//
//  SettingsView.swift
//  AVOCADOS
//
//  Created by DustyTheCutie on 2023-04-25.
//

import SwiftUI

struct SettingsView: View {
    
    @State private var enableNotification : Bool = true
    @State private var backgroundRefresh: Bool = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            VStack(alignment: .center, spacing: 5) {
                Image("avocado")
                    .resizable()
                    .scaledToFit()
                    .padding(.top)
                    .frame(width: 100, height: 100, alignment: .center)
                    .shadow(color: Color("ColorBlackTransparentLight"), radius: 8, x:0, y:4)
                
                Text("Avocados".uppercased())
                    .font(.system(.title, design: .serif))
                    .bold()
                .foregroundColor(Color("ColorGreenAdaptive"))
            }
            .padding()
            
            Form{
                Section(header: Text("General Settings")) {
                    Toggle(isOn: $enableNotification){
                        Text("Enable Notification")
                    }
                    
                    Toggle(isOn: $backgroundRefresh){
                        Text("Background Refresh")
                    }
                }
                
                Section(header: Text("Application")) {
                    
                    if enableNotification{
                        HStack{
                            Text("Name")
                                .foregroundColor(.gray)
                            Spacer()
                            Text("Avocados")
                        }
                        
                        HStack{
                            Text("Version")
                                .foregroundColor(.gray)
                            Spacer()
                            Text("16+")
                        }
                        
                        HStack{
                            Text("Author")
                                .foregroundColor(.gray)
                            Spacer()
                            Text("Dustin Trinh")
                        }
                        
                        HStack{
                            Text("Credit")
                                .foregroundColor(.gray)
                            Spacer()
                            Text("Udemy")
                        }
                    }
                    else{
                        HStack{
                            Text("Personal Message")
                                .foregroundColor(.gray)
                            Spacer()
                            Text("Happy Coding !!!!")
                            
                        }
                    }
                }
            }
        }
        .frame(maxWidth: 640)
    }
    
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
