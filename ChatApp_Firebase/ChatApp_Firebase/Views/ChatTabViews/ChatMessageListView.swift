//
//  ChatMessageListView.swift
//  ChatApp_Firebase
//
//  Created by DustyTheCutie on 2023-06-23.
//

import SwiftUI
import FirebaseAuth

struct ChatMessageListView: View {
    
    let chatMessages: [ChatMsg]
    
    private func senderVerification(chatMsg: ChatMsg) -> Bool{
        guard let userID = Auth.auth().currentUser?.uid else {return false}
        
        return userID == chatMsg.uid
    }
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(chatMessages) {message in
                    VStack {
                        if senderVerification(chatMsg: message){
                            HStack{
                                Spacer()
                                ChatMessageView(msg: message, direction: senderVerification(chatMsg: message) ? .right : .left)
                            }
                        }
                        else{
                            HStack{
                                ChatMessageView(msg: message, direction: senderVerification(chatMsg: message) ? .right : .left)
                                Spacer()
                            }
                        }
                        Spacer()
                            .frame(height: 20)
                            .id(message.id)
                    }.listRowSeparator(.hidden)
                }
            }
        }
        .padding([.bottom], 60)
        
    }
}

struct ChatMessageListView_Previews: PreviewProvider {
    static var previews: some View {
        ChatMessageListView(chatMessages: [])
    }
}
