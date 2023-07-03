//
//  SignUpView.swift
//  ChatApp_Firebase
//
//  Created by DustyTheCutie on 2023-06-16.
//

import SwiftUI
import FirebaseAuth

struct SignUpView: View {
    @EnvironmentObject private var model: Model
    @EnvironmentObject private var appState: AppStates
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var displayName: String = ""
    
    @State private var errorAlert: Bool = false
    @State private var errorMsg: String = ""
    
    private var isFormValid: Bool{
        !email.isEmptyOrWhiteSpace && !password.isEmptyOrWhiteSpace && !displayName.isEmptyOrWhiteSpace
    }
    
    private func signUp() async {
        do{
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            try await model.updateDisplayName(for: result.user, displayName: displayName)
            appState.routes.append(.main)
        }catch{
            appState.errorWrapper = ErrorWrapper(error: error)
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
                TextField("Username", text: $displayName)
                    .textInputAutocapitalization(.never)
                
                HStack {
                    Spacer()
                    Button("Sign Up") {
                        Task{
                            await signUp()
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
        .navigationTitle("SignUp")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
            .environmentObject(Model())
            .environmentObject(AppStates())
    }
}
