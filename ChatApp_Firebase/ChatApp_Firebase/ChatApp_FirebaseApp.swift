//
//  ChatApp_FirebaseApp.swift
//  ChatApp_Firebase
//
//  Created by DustyTheCutie on 2023-06-16.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        return true
    }
}

@main
struct ChatApp_FirebaseApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @StateObject private var appState = AppStates()
    @StateObject private var model = Model()
    
    var body: some Scene {
        WindowGroup {
            
            NavigationStack(path: $appState.routes) {
                VStack{
                    if Auth.auth().currentUser != nil {
                        MainView()
                    }
                    else{
                        AuthenticationView()
                    }
                }
                .navigationDestination(for: Routes.self){ route in
                    switch route{
                    
                    case .authentication:
                        AuthenticationView()
                            .navigationBarBackButtonHidden(true)
                    case .signup:
                        SignUpView()
                    case .login:
                        LoginView()
                    case .main:
                        MainView()
                            .navigationBarBackButtonHidden(true)
                    }
                    
                }
            }
            .overlay(alignment: .center ,content: {
                switch appState.loadingStates{
                case .idle:
                    EmptyView()
                case .loading(let msg):
                    LoadingView(message: msg)
                }
            })
            .environmentObject(appState)
            .environmentObject(model)
        }
    }
}
