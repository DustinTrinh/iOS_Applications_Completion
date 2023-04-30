//
//  AddToCartDetailView.swift
//  TouchDown_Ecom
//
//  Created by DustyTheCutie on 2023-04-30.
//

import SwiftUI

struct AddToCartDetailView: View {
    
    var r: Double
    var g: Double
    var b: Double
    
    var body: some View {
        Button {
            //
        } label: {
            Spacer()
            Text("ADD TO CART")
                .font(.system(.title, design: .rounded))
                .fontWeight(.bold)
                .foregroundColor(.white)
            Spacer()
        }
        .padding(15)
        .background(
            Color(red: r, green: g, blue: b)
        )
        .clipShape(Capsule())

    }
}

struct AddToCartDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AddToCartDetailView(r: productsData[0].red, g: productsData[0].green, b: productsData[0].blue)
    }
}
