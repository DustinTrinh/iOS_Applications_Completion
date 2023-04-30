//
//  RecipeModel.swift
//  AVOCADOS
//
//  Created by DustyTheCutie on 2023-04-27.
//

import Foundation
import SwiftUI

// MARK: - RECIPE MODEL

struct Recipe: Identifiable {
  var id = UUID()
  var title: String
  var headline: String
  var image: String
  var rating: Int
  var serves: Int
  var preparation: Int
  var cooking: Int
  var instructions: [String]
  var ingredients: [String]
}
