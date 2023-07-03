//
//  GroupDetailConfig.swift
//  ChatApp_Firebase
//
//  Created by DustyTheCutie on 2023-06-27.
//

import Foundation
import SwiftUI

struct GroupDetailConfig {
    
    var chatText: String = ""
    var selectedImage: UIImage?
    var showOptions: Bool = false
    
    mutating func clearForm() {
        chatText = ""
        selectedImage = nil
    }
    
    var isValid: Bool {
        !chatText.isEmptyOrWhiteSpace || selectedImage != nil
    }
}
