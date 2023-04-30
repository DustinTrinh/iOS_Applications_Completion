//
//  RecipeCardView.swift
//  AVOCADOS
//
//  Created by DustyTheCutie on 2023-04-27.
//

import SwiftUI

struct RecipeCardView: View {
    
    var recipe: Recipe
    @State private var showModal: Bool = false
    var hapticImpact = UIImpactFeedbackGenerator(style: .heavy)
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            Image(recipe.image)
                .resizable()
                .scaledToFit()
                .overlay(
                    VStack {
                        HStack {
                            Spacer()
                            Image(systemName: "bookmark")
                                .font(.title)
                                .fontWeight(.light)
                                .foregroundColor(.white)
                                .imageScale(.small)
                                .shadow(color: Color("ColorBlackTransparentLight"), radius: 2, x: 0, y: 0)
                                .padding(.trailing, 20)
                            .padding(.top, 22)
                        }
                        Spacer()
                    }
                )
            
            VStack(alignment: .leading, spacing: 12){
                Text(recipe.title)
                    .font(.system(.title, design: .serif))
                    .fontWeight(.bold)
                    .foregroundColor(Color("ColorGreenMedium"))
                    .lineLimit(1)
                
                Text(recipe.headline)
                    .font(.system(.body, design: .serif))
                    .foregroundColor(.gray)
                    .italic()
                
                //RATING
                RecipeRatingView(rating: recipe.rating)
                
                //COOKING
                RecipeCookingView(serves: recipe.serves, preparation: recipe.preparation, cooking: recipe.cooking)
                    
            }
            .padding()
            .padding(.bottom, 12)
        }
        .background(.white)
        .cornerRadius(12)
        .shadow(color: Color("ColorBlackTransparentLight") ,radius: 8, x:0, y:0)
        .onTapGesture {
            hapticImpact.impactOccurred()
            showModal = true
        }
        .sheet(isPresented: $showModal){
            RecipeDetailView(recipe: recipe)
        }
    }
}

struct RecipeCardView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeCardView(recipe: recipesData[1])
    }
}
