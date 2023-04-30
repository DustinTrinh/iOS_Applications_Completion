//
//  RipeningModel.swift
//  AVOCADOS
//
//  Created by DustyTheCutie on 2023-04-27.
//

import Foundation
import SwiftUI

// MARK: RIPENING MODEL

struct Ripening: Identifiable {
  var id = UUID()
  var image: String
  var stage: String
  var title: String
  var description: String
  var ripeness: String
  var instruction: String
}
