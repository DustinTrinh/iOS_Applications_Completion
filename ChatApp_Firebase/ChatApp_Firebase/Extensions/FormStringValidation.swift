//
//  FormStringValidation.swift
//  ChatApp_Firebase
//
//  Created by DustyTheCutie on 2023-06-17.
//

import Foundation

extension String {
    var isEmptyOrWhiteSpace: Bool {
        self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
