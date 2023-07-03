//
//  ErrorWrapper.swift
//  ChatApp_Firebase
//
//  Created by DustyTheCutie on 2023-06-29.
//

import Foundation

struct ErrorWrapper: Identifiable {
    
    let id = UUID()
    let error: Error
    let guide: String = ""
}
