//
//  SettingsTabView.swift
//  ChatApp_Firebase
//
//  Created by DustyTheCutie on 2023-06-21.
//

import SwiftUI
import FirebaseAuth
import Photos
import PhotosUI
import FirebaseStorage

struct SettingsTabView: View {
    @EnvironmentObject private var appState: AppStates
    @EnvironmentObject private var model: Model
    
    @State private var settingsConfig = SettingsConfiguration()
    @State private var showCamera: Bool = false
    @State private var showLibrary: Bool = false
    @State private var inputImage: UIImage?
    @State private var edittingName: Bool = false
    @State private var currentPhotoURL: URL? = Auth.auth().currentUser!.photoURL
    @FocusState private var isEditing: Bool
    
    
    private func logout() async {
        do{
            let _ =  try Auth.auth().signOut()
            appState.routes.append(.authentication)
        }
        catch{
            print(error.localizedDescription)
        }
    }
    
    var displayName: String {
        guard let displayName = Auth.auth().currentUser?.displayName else {return "NoOne"}
        return displayName
    }
    
    var body: some View {
        
        VStack {
            AsyncImage(url: currentPhotoURL){ img in
                img.rounded()
            } placeholder: {
                Image(systemName: "person.crop.circle.fill")
                    .rounded()
            }
            .onTapGesture {
                settingsConfig.showPhotoOptions = true
            }
            .confirmationDialog("Select", isPresented: $settingsConfig.showPhotoOptions) {
                
                Button("Camera") {
                    showCamera = true
                }
                
                Button("Photo Library") {
                    showLibrary = true
                }
                
            }
            
            TextField(settingsConfig.displayName, text: $settingsConfig.displayName, onEditingChanged: {
                self.edittingName = $0
                print(self.edittingName)
            })
                .textFieldStyle(.roundedBorder)
                .focused($isEditing)
                .textInputAutocapitalization(.never)
                .padding()
            
            Button("Save Info") {
                guard let currentUser = Auth.auth().currentUser else {return}
                Task{
                    do{
                        try await model.updateDisplayName(for: currentUser, displayName: settingsConfig.displayName)
                    }
                    catch{
                        print(error.localizedDescription)
                    }
                }
                edittingName.toggle()
            }
            .disabled(!edittingName)
            Spacer()
            Button("Logout") {
                Task{
                    await logout()
                }
            }
        }
        .sheet(isPresented: $showCamera, content: {
            ImagePickerCamera(image: $settingsConfig.selectedImage)
        })
        .sheet(isPresented: $showLibrary, content: {
            ImagePickerLibrary(image: $inputImage)
        })
        .onChange(of: inputImage) { img in
            guard let i = img,
                  let resizedImage = i.resize(to: CGSize(width: 80, height: 80)),
                  let imageData = resizedImage.pngData() else{return}
            
            Task{
                guard let currentUser = Auth.auth().currentUser else {return}
                let fileName = "\(currentUser.uid).png"
                
                do{
                    let url = try await Storage.storage().uploadData(for: fileName, data: imageData, bucket: .photos)
                    try await model.updatePhotoURL(for: currentUser, photoURL: url)
                    currentPhotoURL = url
                }
                catch{
                    print(error.localizedDescription)
                }
            }
        }
        .onChange(of: settingsConfig.selectedImage, perform: { img in
            guard let i = img,
                  let resizedImage = i.resize(to: CGSize(width: 80, height: 80)),
                  let imageData = resizedImage.pngData() else{return}
        })
        .onAppear{
            settingsConfig.displayName = displayName
            //loadImage()
        }
    }
}



struct SettingsTabView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsTabView()
            .environmentObject(AppStates())
            .environmentObject(Model())
    }
}
