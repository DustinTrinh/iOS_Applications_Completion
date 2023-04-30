//
//  HeaderView.swift
//  AVOCADOS
//
//  Created by DustyTheCutie on 2023-04-25.
//

import SwiftUI

struct HeaderView: View {
    
    var header: Header
    
    var body: some View {
        ZStack {
            Image(header.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                
            HStack(alignment: .top, spacing: 0) {
                Rectangle()
                    .fill(Color("ColorGreenLight"))
                    .frame(width: 4)
                
                VStack(alignment: .leading, spacing: 0){
                    Text(header.headline)
                        .font(.system(.title, design: .serif))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .shadow(radius: 3)
                    Text(header.subheadline)
                        .font(.footnote)
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.white)
                        .shadow(radius: 3)
                }
                .padding(.vertical, 0)
                .padding(.horizontal, 20)
                .background(Color("ColorBlackTransparentLight"))
            .frame(width: 281, height: 105)
            }
            .frame(width: 285, height: 105, alignment: .center)
            .offset(x: -50, y:75)
        }
        .frame(width: 480, height: 320, alignment: .center)
        .edgesIgnoringSafeArea(.top)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(header: headersData[1])
    }
}
