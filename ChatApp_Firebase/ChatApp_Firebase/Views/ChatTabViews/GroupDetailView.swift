//
//  GroupDetailView.swift
//  ChatApp_Firebase
//
//  Created by DustyTheCutie on 2023-06-22.
//

import SwiftUI
import FirebaseAuth
import FirebaseStorage

struct GroupDetailView: View {
    let group: Group
    @EnvironmentObject private var model: Model
    @EnvironmentObject private var appState: AppStates
    @FocusState private var isChatTextFieldFocused: Bool
    @State private var chatMsg: String = ""
    @State private var groupDetailConfig = GroupDetailConfig()
    @State private var showCamera: Bool = false
    @State private var showLibrary: Bool = false
    @State private var inputImage: UIImage?
    
    private var emptyMsg: Bool {
        !chatMsg.isEmptyOrWhiteSpace
    }
    
    private func sendMsg() async throws {
        guard let currentUser = Auth.auth().currentUser else {return}
        var chatMsg = ChatMsg(uid: currentUser.uid, text: groupDetailConfig.chatText, displayName: currentUser.displayName ?? "", profilePhotoURL: currentUser.photoURL == nil ? "" : currentUser.photoURL!.absoluteString)
        
        if let selectedImage = groupDetailConfig.selectedImage{
            guard let resizedImage = selectedImage.resize(to: CGSize(width: 600, height: 600)),
                  let imageData = resizedImage.pngData()
            else{return}
            
            let url = try await Storage.storage().uploadData(for: UUID().uuidString, data: imageData, bucket: .attachments)
            chatMsg.attachmentPhotoURL = url.absoluteString
        }
        
        
        try await model.sendChatMsgToGroup(chatMsg: chatMsg, group: group)
    }
    
    private func clearInput() {
        groupDetailConfig.clearForm()
        appState.loadingStates = .idle
    }
    
    var body: some View {
        VStack{
            ScrollViewReader { proxy in
                ChatMessageListView(chatMessages: model.chatMessages)
                    .onChange(of: model.chatMessages) { newValue in
                        if !model.chatMessages.isEmpty {
                            let lastMsg = model.chatMessages[model.chatMessages.endIndex - 1]
                            withAnimation {
                                proxy.scrollTo(lastMsg.id, anchor: .bottom)
                            }
                        }
                    }
            }
            
            Spacer()
            
            .disabled(!emptyMsg)
        }
        .frame(maxWidth: .infinity)
        .confirmationDialog("Insert Photos", isPresented: $groupDetailConfig.showOptions, actions: {
            Button("Camera") {
                showCamera = true
            }
            
            Button("Photo Library") {
                showLibrary = true
            }
        })
        .overlay(alignment: .center ,content: {
            if let selectedImg = groupDetailConfig.selectedImage{
                PreviewImgView(selectedImg: selectedImg) {
                    withAnimation {
                        groupDetailConfig.selectedImage = nil
                    }
                }
            }
        })
        .overlay(alignment: .bottom, content: {
            ChatBoxView(groupDetailConfig: $groupDetailConfig,isChatTextFieldFocused: _isChatTextFieldFocused) {
                //Send MSG
                Task{
                    do{
                        appState.loadingStates = .loading("Sending...")
                        try await sendMsg()
                        clearInput()
                    }
                    catch{
                        print(error.localizedDescription)
                        clearInput()
                    }
                }
            }
        })
        .navigationTitle(group.subject)
        .navigationBarTitleDisplayMode(.inline)
        .padding()
        .onAppear{
            model.listenChatMsg(in: group)
        }
        .onDisappear{
            model.detachListener()
        }
        .sheet(isPresented: $showCamera, content: {
            ImagePickerCamera(image: $groupDetailConfig.selectedImage)
        })
        .sheet(isPresented: $showLibrary, content: {
            ImagePickerLibrary(image: $groupDetailConfig.selectedImage)
        })
    }
}

struct GroupDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            GroupDetailView(group: Group(subject: "Movies"))
                .environmentObject(Model())
                .environmentObject(AppStates())
        }
    }
}
