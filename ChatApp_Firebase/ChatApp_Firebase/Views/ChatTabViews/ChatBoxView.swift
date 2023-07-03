//
//  ChatBoxView.swift
//  ChatApp_Firebase
//
//  Created by DustyTheCutie on 2023-06-27.
//

import SwiftUI

struct ChatBoxView: View {
    
    @Binding var groupDetailConfig: GroupDetailConfig
    @FocusState var isChatTextFieldFocused: Bool
    var onSendMessage: () -> Void
    
    var body: some View {
        HStack {
            Button {
                groupDetailConfig.showOptions = true
            } label: {
                Image(systemName: "photo.circle.fill")
                    .font(.largeTitle)
            }
            
            TextField("Enter Message", text: $groupDetailConfig.chatText)
                .textFieldStyle(.roundedBorder)
                .focused($isChatTextFieldFocused)
            
            Button {
                if groupDetailConfig.isValid {
                    onSendMessage()
                }
            } label: {
                Image(systemName: "arrow.up.square.fill")
                    .font(.largeTitle)
            }
            
            
        }
        .padding()
    }
}

struct ChatBoxView_Previews: PreviewProvider {
    static var previews: some View {
        ChatBoxView(groupDetailConfig: .constant(GroupDetailConfig(chatText: "Hello bud")), onSendMessage: {})
    }
}
