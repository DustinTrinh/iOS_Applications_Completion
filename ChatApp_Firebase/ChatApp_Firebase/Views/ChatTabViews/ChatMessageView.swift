//
//  ChatMessageView.swift
//  ChatApp_Firebase
//
//  Created by DustyTheCutie on 2023-06-23.
//

import SwiftUI

enum MessageSenderReceiver {
    case left
    case right
}

struct ChatMessageView: View {
    
    let msg: ChatMsg
    let direction: MessageSenderReceiver
    
    @ViewBuilder
    private func profilePhotoForChatMsg(chatMsg: ChatMsg) -> some View {
        if let profileURL = chatMsg.getProfilePhotoURL{
            AsyncImage(url: profileURL){ img in
                img.rounded(width: 35, height: 35)
            } placeholder: {
                Image(systemName: "person.crop.circle.fill")
                    .rounded(width: 34, height: 34)
            }
        }
        else{
            Image(systemName: "person.crop.circle.fill")
                .rounded(width: 35, height: 35)
        }
    }
    
    var body: some View {
        HStack {
            //Profile Photo
            if direction == .left{
                profilePhotoForChatMsg(chatMsg: msg)
            }
            
            VStack(alignment: direction == .left ? .leading : .trailing, spacing: 5){
                Text(msg.displayName)
                    .opacity(0.8)
                    .font(.caption)
                    .foregroundColor(.white)
                
                //Attachment Photo URL
                if let attachmentPhotoURL = msg.getAttachmentPhotoURL {
                    AsyncImage(url: attachmentPhotoURL){ img in
                        img.resizable()
                            .aspectRatio(contentMode: .fit)
                    } placeholder: {
                        ProgressView("Loading...")
                    }
                }
                
                Text(msg.text)
                
                Text(msg.dateCreated, format: .dateTime)
                    .font(.caption)
                    .opacity(0.4)
                    .frame(maxWidth: 200, alignment: direction == .left ? .leading : .trailing)
            }
            .padding(8)
            .foregroundColor(.white)
            .background(direction == .left ? .red : .blue)
            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            
            //Profile Photo
            if direction == .right{
                profilePhotoForChatMsg(chatMsg: msg)
            }
        }
        .listRowSeparator(.hidden)
        .overlay(alignment: direction == .left ? .bottomLeading : .bottomTrailing) {
            Image(systemName: "arrowtriangle.down.fill")
                .font(.title)
                .rotationEffect(.degrees(direction == .left ? 45 : -45))
                .offset(x: direction == .left ? 30:-30, y:10)
                .foregroundColor(direction == .left ? .red : .blue)
        }
    }
}

struct ChatMessageView_Previews: PreviewProvider {
    static var previews: some View {
        ChatMessageView(msg: ChatMsg(uid: "aaaaa", text: "What's Up", dateCreated: Date(), displayName: "DustyTheCutie"), direction: .right)
    }
}
