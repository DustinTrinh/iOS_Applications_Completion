//
//  ProductModel.swift
//  TouchDown_Ecom
//
//  Created by DustyTheCutie on 2023-04-29.
//

import Foundation

struct Product: Identifiable, Codable{
    var id: Int
    var name: String
    var image: String
    var price: Int
    var description: String
    let color: [Double]
    
    var red: Double { return color[0] }
    var green: Double { return color[1] }
    var blue: Double { return color[2] }
    
    var formattedPrice: String { return "$\(price)" }
}
