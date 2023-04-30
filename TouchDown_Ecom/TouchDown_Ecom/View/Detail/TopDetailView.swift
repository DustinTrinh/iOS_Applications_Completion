//
//  TopDetailView.swift
//  TouchDown_Ecom
//
//  Created by DustyTheCutie on 2023-04-29.
//

import SwiftUI

struct TopDetailView: View {
    
    var price: String
    var image: String
    @State private var isAnimating: Bool = false
    
    var body: some View {
        HStack(alignment: .center, spacing: 5) {
            //MARK: - PRICE
            VStack(alignment: .leading, spacing: 5) {
                Text("Price")
                    .fontWeight(.semibold)
                
                Text(price)
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .scaleEffect(1.35, anchor: .leading)
            }
            .offset(y: isAnimating ? -50 : -75)
            
            Spacer()
            
            //MARK: - PHOTO
            Image(image)
                .resizable()
                .scaledToFit()
                .offset(y: isAnimating ? 0 : -35)
        }
        .onAppear {
            withAnimation(.easeOut(duration: 1)){
                isAnimating.toggle()
            }
        }
    }
}

struct TopDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TopDetailView(price: productsData[2].formattedPrice, image: productsData[2].image)
    }
}
