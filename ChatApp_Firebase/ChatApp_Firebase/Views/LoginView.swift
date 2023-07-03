//
//  LoginView.swift
//  ChatApp_Firebase
//
//  Created by DustyTheCutie on 2023-06-17.
//

import SwiftUI
import FirebaseAuth

struct LoginView: View {
    @EnvironmentObject private var appState: AppStates
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    @State private var errorAlert: Bool = false
    @State private var errorMsg: String = ""
    
    private var isFormValid: Bool{
        !email.isEmptyOrWhiteSpace && !password.isEmptyOrWhiteSpace
    }
    
    private func login() async{
        do{
            let _ = try await Auth.auth().signIn(withEmail: email, password: password)
            appState.routes.append(.main)
        }
        catch{
            print(error.localizedDescription)
            errorMsg = error.localizedDescription
            errorAlert = true
        }
    }
    
    var body: some View {
        VStack {
            Form {
                TextField("Email", text: $email)
                    .textInputAutocapitalization(.never)
                SecureField("Password", text: $password)
                    .textInputAutocapitalization(.never)
                
                HStack {
                    Spacer()
                    Button("Sign In") {
                        Task{
                            await login()
                        }
                    }
                    .disabled(!isFormValid)
                    .alert(isPresented: $errorAlert) {
                        Alert(title: Text("Error Message"),
                              message: Text(errorMsg),
                              dismissButton: .default(Text("Close")))
                    }
                    
                    Spacer()
                }
            }
            
            
        }
        .navigationTitle("Login")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView().environmentObject(AppStates())
    }
}
