//
//  RecipeRatingView.swift
//  AVOCADOS
//
//  Created by DustyTheCutie on 2023-04-27.
//

import SwiftUI

struct RecipeRatingView: View {
    var rating: Int
    var body: some View {
        HStack{
            ForEach(1...(rating), id: \.self){_ in
                Image(systemName: "star.fill")
                    .font(.body)
                    .foregroundColor(.yellow)
            }
        }
    }
}

struct RecipeRatingView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeRatingView(rating: 4)
    }
}
