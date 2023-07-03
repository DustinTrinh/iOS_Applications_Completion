//
//  ChatMsg.swift
//  ChatApp_Firebase
//
//  Created by DustyTheCutie on 2023-06-23.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct ChatMsg: Codable, Identifiable, Equatable {
    
    @DocumentID var documentID: String?
    let uid: String
    let text: String
    var dateCreated = Date()
    let displayName: String
    var profilePhotoURL: String = ""
    var attachmentPhotoURL: String = ""
    
    var id: String {
        documentID ?? UUID().uuidString
    }
    
    var getAttachmentPhotoURL: URL? {
        attachmentPhotoURL.isEmpty ? nil : URL(string: attachmentPhotoURL)
    }
    
    var getProfilePhotoURL: URL? {
        profilePhotoURL.isEmpty ? nil : URL(string: profilePhotoURL)
    }
    
}

extension ChatMsg {
    
    func toDictionary() -> [String:Any] {
        return [
            "uid": uid,
            "text": text,
            "dateCreated": dateCreated,
            "displayName": displayName,
            "profilePhotoURL": profilePhotoURL,
            "attachmentPhotoURL": attachmentPhotoURL
        ]
    }
    
    static func fromSnapshot(snapshot: QueryDocumentSnapshot) -> ChatMsg?{
        let dictionary = snapshot.data()
        
        guard let text = dictionary["text"] as? String,
              let uid = dictionary["uid"] as? String,
              let dateCreated = (dictionary["dateCreated"] as? Timestamp)?.dateValue(),
              let displayName = dictionary["displayName"] as? String,
              let profilePhotoURL = dictionary["profilePhotoURL"] as? String,
              let attachmentPhotoURL = dictionary["attachmentPhotoURL"] as? String
            
        else {
            return nil
        }
        
        return ChatMsg(documentID: snapshot.documentID ,uid: uid, text: text, dateCreated: dateCreated, displayName: displayName, profilePhotoURL: profilePhotoURL, attachmentPhotoURL: attachmentPhotoURL)
        
    }
}
