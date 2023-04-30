//
//  FeaturedItemView.swift
//  TouchDown_Ecom
//
//  Created by DustyTheCutie on 2023-04-29.
//

import SwiftUI

struct FeaturedItemView: View {
    
    //MARK: - PROPERTIES
    private let players: [Player] = playersData
    var body: some View {
            TabView{
                ForEach(players) { player in
                    Image(player.image)
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(12)
                }
                .padding(.top, 10)
                .padding(.horizontal, 15)
                
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .frame(minHeight: 256)
    }
}

struct FeaturedItemView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedItemView()
    }
}
