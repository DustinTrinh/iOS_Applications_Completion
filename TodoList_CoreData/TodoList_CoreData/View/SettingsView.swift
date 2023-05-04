//
//  SettingsView.swift
//  TodoList_CoreData
//
//  Created by DustyTheCutie on 2023-05-04.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.dismiss) var dismiss
    private let themes: [Theme] = themeData
    @State private var changedTheme: Bool = false
    @ObservedObject var theme = ThemeSettings()
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .center, spacing: 0) {
                Form {
                    //MARK: - SECTION THEME
                    Section(content: {
                        List{
                            ForEach(themes) { theme in
                                Button {
                                    self.theme.themeSettings = theme.id
                                    UserDefaults.standard.set(self.theme.themeSettings, forKey: "Theme")
                                    changedTheme.toggle()
                                } label: {
                                    HStack {
                                        Image(systemName: "circle.fill")
                                            .foregroundColor(theme.themeColor)
                                        Text(theme.themeName)
                                        
                                    }
                                }
                            }
                        }
                        .alert(isPresented: $changedTheme) {
                            Alert(title: Text("Theme Changed"), message: Text("Theme had been changed. Please restart the application to see changes"), dismissButton: .default(Text("Got it!")))
                        }
                    } , header: {
                        HStack {
                            Text("Themes")
                            Image(systemName: "circle.fill")
                                .resizable()
                                .frame(width: 10, height: 10)
                                .foregroundColor(themes[theme.themeSettings].themeColor)
                        }
                    })

                    
                    //MARK: - SECTION ABOUT
                    Section(header: Text("Application Info")) {
                        FormRowStaticView(icon: "app", first: "Application", second: "Todo")
                        FormRowStaticView(icon: "gear", first: "Compatible", second: "iOS 16+")
                        FormRowStaticView(icon: "number.circle.fill", first: "Version", second: "1.0.0")
                        FormRowStaticView(icon: "person.circle.fill", first: "Developer", second: "Dustin Trinh")
                    }
                    
                    //MARK: - SECTION LEARN MORE
                    Section {
                        FormRowLinkView(icon: "globe", color: .pink, text: "Portfolio", link: "https://dustintrinh.com")
                        FormRowLinkView(icon: "globe", color: .blue, text: "Udemy", link: "https://www.udemy.com/course/swiftui-masterclass-course-ios-development-with-swift/")
                    
                    } header: {
                        Text("Websites")
                    }
                }
                .listStyle(GroupedListStyle())
                .environment(\.horizontalSizeClass, .regular)
                
                
                Text("Copyright © All rights reserved.\n❤️Dustin Trinh❤️")
                    .font(.footnote)
                    .multilineTextAlignment(.center)
                    .padding(.top, 5)
                    .padding(.bottom, 8)
                    .foregroundColor(.secondary)
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
            .background(Color("ColorBackground"))
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "x.circle")
                    }

                }
            }
        }
        .tint(themes[theme.themeSettings].themeColor)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
