//
//  NavigationBarDetailedView.swift
//  TouchDown_Ecom
//
//  Created by DustyTheCutie on 2023-04-29.
//

import SwiftUI

struct NavigationBarDetailedView: View {
    //MARK: - PROPERTIES
    
    @EnvironmentObject var shop: Shop
    
    var body: some View {
        HStack{
            Button {
                withAnimation(.easeIn){
                    shop.selectedProduct = nil
                    shop.showingProduct = false
                }
            } label: {
                Image(systemName: "chevron.left")
                    .font(.title)
                    .foregroundColor(.white)
            }
            
            Spacer()
            
            Button {
                //
            } label: {
                Image(systemName: "cart")
                    .font(.title)
                    .foregroundColor(.white)
            }


        }
    }
}

struct NavigationBarDetailedView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarDetailedView()
            .environmentObject(Shop())
            .background(.gray)
    }
}
