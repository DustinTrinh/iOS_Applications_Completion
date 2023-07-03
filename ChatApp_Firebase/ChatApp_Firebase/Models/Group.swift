//
//  Group.swift
//  ChatApp_Firebase
//
//  Created by DustyTheCutie on 2023-06-21.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Group: Codable, Identifiable {
    
    @DocumentID var documentID: String?
    let subject: String
    
    var id: String {
        documentID ?? UUID().uuidString
    }
}

extension Group {
    func toDictionary() -> [String: Any]{
        return ["subject":subject]
    }
    
    static func fromSnapshot(snapshot: QueryDocumentSnapshot) -> Group? {
        let dict = snapshot.data()
        guard let subject = dict["subject"] as? String else {
            return nil
        }
        
        return Group(documentID: snapshot.documentID, subject: subject)
    }
}
