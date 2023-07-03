//
//  Global_Model.swift
//  ChatApp_Firebase
//
//  Created by DustyTheCutie on 2023-06-17.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

@MainActor
class Model: ObservableObject {
    
    @Published var groups: [Group] = []
    @Published var chatMessages: [ChatMsg] = []
    
    var firestoreListener: ListenerRegistration?
    
    func updateDisplayName(for user: User, displayName: String) async throws {
        let request = user.createProfileChangeRequest()
        request.displayName = displayName
        try await request.commitChanges()
        try await updateUserInfoForMsg(uid: user.uid, updatedInfo: ["displayName": user.displayName ?? "NoOne"])
    }
    
    func updatePhotoURL(for user: User, photoURL: URL) async throws {
        let request = user.createProfileChangeRequest()
        request.photoURL = photoURL
        try await request.commitChanges()
        
        try await updateUserInfoForMsg(uid: user.uid, updatedInfo: ["profilePhotoURL": photoURL.absoluteString])
    }
    
    func fetchGroups() async throws {
        let db = Firestore.firestore()
        let snapshot = try await db.collection("Chat_Groups").getDocuments()
        
        groups = snapshot.documents.compactMap({ snapshot in
            Group.fromSnapshot(snapshot: snapshot)
        })
    }
    
    func addGroup(group: Group){
        let db = Firestore.firestore()
        let collectionRef = db.collection("Chat_Groups")
        
        do {
            let _ = try collectionRef.addDocument(from: group)
            groups.append(group)
        }
        catch {
            print(error)
        }
    }
    
    func sendChatMsgToGroup(chatMsg: ChatMsg, group: Group) async throws {
        let db = Firestore.firestore()
        guard let groupDocId = group.documentID else {return}
        
        let _ = try await db.collection("Chat_Groups")
            .document(groupDocId)
            .collection("Messages")
            .addDocument(data: chatMsg.toDictionary())
        print(chatMsg.uid)
        print(chatMsg.displayName)
        print(chatMsg.dateCreated)
    }
    
    func listenChatMsg(in group: Group){
        
        let db = Firestore.firestore()
        chatMessages.removeAll()
        guard let documentID = group.documentID else{ return}
        
        self.firestoreListener = db.collection("Chat_Groups")
            .document(documentID)
            .collection("Messages")
            .order(by: "dateCreated", descending: false)
            .addSnapshotListener({ [weak self] snapshot, err in
                guard let snapshot = snapshot else{
                    print("Error: \(err?.localizedDescription ?? "")")
                    return
                }
                
                snapshot.documentChanges.forEach { diff in
                    let chatMessage = ChatMsg.fromSnapshot(snapshot: diff.document)
                    if let chatMessage {
                        let exist = self?.chatMessages.contains(where: { chat in
                            chat.documentID == chatMessage.documentID
                        })
                        
                        if !exist! {
                            self?.chatMessages.append(chatMessage)
                        }
                    }
                }
            })
    }
    
    private func updateUserInfoForMsg(uid: String, updatedInfo: [AnyHashable: Any]) async throws {
        
        let db = Firestore.firestore()
        let groupDocs = try await db.collection("Chat_Groups").getDocuments().documents
        
        for groupDoc in groupDocs {
            let msgs = try await groupDoc.reference.collection("Messages")
                .whereField("uid", isEqualTo: uid)
                .getDocuments().documents
            
            for msg in msgs {
                try await msg.reference.updateData(updatedInfo)
            }
        }
        
    }
    
    func detachListener(){
        self.firestoreListener?.remove()
    }
    

    
    
}
