//
//  Shop.swift
//  TouchDown_Ecom
//
//  Created by DustyTheCutie on 2023-04-30.
//

import Foundation

class Shop: ObservableObject {
    @Published var showingProduct: Bool = false
    @Published var selectedProduct: Product? = nil
}
