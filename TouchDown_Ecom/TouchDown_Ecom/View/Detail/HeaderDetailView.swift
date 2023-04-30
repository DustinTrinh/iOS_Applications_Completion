//
//  HeaderDetailView.swift
//  TouchDown_Ecom
//
//  Created by DustyTheCutie on 2023-04-29.
//

import SwiftUI

struct HeaderDetailView: View {
    
    var productHeader: String
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Protective Gear")
            
            Text(productHeader)
                .font(.largeTitle)
                .fontWeight(.black)
        }
    }
}

struct HeaderDetailView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderDetailView(productHeader: "Test")
    }
}
