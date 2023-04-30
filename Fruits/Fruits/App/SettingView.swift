//
//  SettingView.swift
//  Fruits
//
//  Created by DustyTheCutie on 2023-04-20.
//

import SwiftUI

struct SettingView: View {
    
    @Environment(\.dismiss) var dismiss
    @AppStorage("isOnboarding") var isOnboarding: Bool = false
    @AppStorage("isDarkMode") private var isDarkMode = false


    var body: some View {
        NavigationView{
            ScrollView(.vertical, showsIndicators: false){
                VStack(spacing: 20){
                    //SECTION 1
                    
                    GroupBox(
                        label:
                            SettingLabelView(labelText: "Fructus", labelImage: "info.circle")
                    ){
                        Divider().padding(.vertical, 5)
                        
                        HStack(alignment: .center, spacing: 10) {
                            Image("logo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                                .cornerRadius(20)
                            Text("Fructus is an application that display various different types of fruits including its descriptions and nutrition values.")
                                .font(/*@START_MENU_TOKEN@*/.footnote/*@END_MENU_TOKEN@*/)
                                
                        }
                    }
                    
                    //SECTION 2
                    GroupBox(
                        label:
                            SettingLabelView(labelText: "Customization", labelImage: "paintbrush")
                    ){
                        Divider().padding(.vertical, 5)
                        Text("You can restart the application by toggle the RESTART button below. It will prompt Onboarding page once you restart the app.")
                            .padding(.vertical, 8)
                            .frame(minHeight: 60)
                            .layoutPriority(1)
                            .font(.footnote)
                            .multilineTextAlignment(.leading)
                        Toggle(isOn: $isOnboarding) {
                            if isOnboarding {
                                Text("RESTART")
                                    .fontWeight(.bold)
                                    .foregroundColor(.green)
                            } else {
                                Text("RESTART")
                                    .fontWeight(.bold)
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding()
                        .background(
                            Color(UIColor.tertiarySystemBackground)
                                .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                        )
                        
                        Divider().padding(.vertical, 5)
                        
                        Toggle(isOn: $isDarkMode) {
                            if isDarkMode {
                                Text("LIGHT MODE")
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                            } else {
                                Text("DARK MODE")
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                            }
                        }
                        .padding()
                        .background(
                            Color(UIColor.tertiarySystemBackground)
                                .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                        )
                        
                    }
                    
                    
                    //SECTION 3
                    GroupBox(
                        label:
                            SettingLabelView(labelText: "Author", labelImage: "person.fill")
                    ){
                        
                        SettingRowView(name: "Developer", content: "Dustin Trinh")
                        SettingRowView(name: "Version", content: "1.0.0")
                        SettingRowView(name: "Profile", linkLabel: "Portfolio", linkDestination: "https://dustintrinh.com")
                        SettingRowView(name: "Credit", linkLabel: "Udemy Course", linkDestination: "https://www.udemy.com/course/swiftui-masterclass-course-ios-development-with-swift/")
                        SettingRowView(name: "SwiftUI Version", content: "4.0")
                        SettingRowView(name: "iOS Version", content: "16.0+")
                    }
                
                    
                }//VSTACK
                .navigationTitle(Text("Settings"))
                .navigationBarTitleDisplayMode(.large)
                .toolbar{
                    Button(action: {
                        dismiss()
                    }, label: {
                        Image(systemName: "xmark")
                    })
                }
                .padding()
            }//SCROLLVIEW
        }//NAVIGATION VIEW
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
