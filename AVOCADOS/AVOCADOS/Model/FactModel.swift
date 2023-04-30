//
//  FactModel.swift
//  AVOCADOS
//
//  Created by DustyTheCutie on 2023-04-26.
//

import Foundation
import SwiftUI

// MARK: - FACT MODEL

struct Fact: Identifiable {
  var id = UUID()
  var image: String
  var content: String
}

