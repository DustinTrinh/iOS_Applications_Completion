//
//  CategoryHeaderView.swift
//  TouchDown_Ecom
//
//  Created by DustyTheCutie on 2023-04-29.
//

import SwiftUI

struct CategoryHeaderView: View {
    
    @State var rotateClockWise: Bool = false
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            Text("CATEGORIES")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .rotationEffect(Angle(degrees: rotateClockWise ? 90 : -90))
            Spacer()
        }
        .background(Color.gray.cornerRadius(12))
        .frame(width: 85)
    }
}

struct CategoryHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHeaderView()
    }
}
