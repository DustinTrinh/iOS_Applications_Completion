//
//  RecipeCookingView.swift
//  AVOCADOS
//
//  Created by DustyTheCutie on 2023-04-27.
//

import SwiftUI

struct RecipeCookingView: View {
    
    let serves: Int
    let preparation: Int
    let cooking: Int
    
    var body: some View {
        HStack(alignment: .center, spacing: 12){
            HStack(alignment: .center, spacing: 2){
                Image(systemName: "person.2")
                Text("Serves: \(serves)")
            }
            
            HStack(alignment: .center, spacing: 2){
                Image(systemName: "clock")
                Text("Prep: \(preparation)")
            }
            
            HStack(alignment: .center, spacing: 2){
                Image(systemName: "flame")
                Text("Cooking: \(cooking)")
            }
        }
        .font(.footnote)
        .foregroundColor(.gray)
    }
}

struct RecipeCookingView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeCookingView(serves: 1, preparation: 1, cooking: 1)
    }
}
