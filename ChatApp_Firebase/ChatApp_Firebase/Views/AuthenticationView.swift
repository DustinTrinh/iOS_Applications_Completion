//
//  AuthenticationView.swift
//  ChatApp_Firebase
//
//  Created by DustyTheCutie on 2023-06-17.
//

import SwiftUI

struct AuthenticationView: View {
    @EnvironmentObject private var appState: AppStates
    
    var body: some View {
        
            VStack {
                Text("DustyTheCutie Chat App")
                    .font(.title)
                Spacer()
                
                Button {
                    appState.routes.append(.signup)
                } label: {
                    HStack {
                        Image(systemName: "envelope.fill")
                            .foregroundColor(Color.black)
                        
                        
                        Text("Sign-up with Email/Password")
                            .font(.headline)
                            .foregroundColor(.white)
                        
                    }
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(.blue)
                    .cornerRadius(10)
                }


                
                Spacer()
                Button {
                    appState.routes.append(.login)
                } label: {
                    HStack {
                        Image(systemName: "envelope.fill")
                            .foregroundColor(Color.black)
                        
                        
                        Text("Already a member? Login")
                            .font(.headline)
                            .foregroundColor(.white)
                        
                    }
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(.blue)
                    .cornerRadius(10)
                }
                
            }
            .padding()
        
    }
}

struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            AuthenticationView()
                .environmentObject(AppStates())
        }
    }
}
