//
//  Constant.swift
//  TouchDown_Ecom
//
//  Created by DustyTheCutie on 2023-04-29.
//

import Foundation
import SwiftUI

// DATA
let playersData: [Player] = Bundle.main.decode("player.json")
let categoriesData: [Category] = Bundle.main.decode("category.json")
let productsData: [Product] = Bundle.main.decode("product.json")
let brandsData: [Brand] = Bundle.main.decode("brand.json")
let sizesData: [String] = ["XS","S", "M","L", "XL"]
// COLOR

let colorBackground: Color = Color("ColorBackground")
let colorGray: Color = Color(UIColor.systemGray4)

// LAYOUT
let columnSpacing: CGFloat = 10
let rowSpacing: CGFloat = 10
var gridLayout: [GridItem] {
  return Array(repeating: GridItem(.flexible(), spacing: rowSpacing), count: 2)
}


// UX
// API
// IMAGE
// FONT
// STRING
// MISC
