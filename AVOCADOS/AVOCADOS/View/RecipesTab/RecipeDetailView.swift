//
//  RecipeDetailView.swift
//  AVOCADOS
//
//  Created by DustyTheCutie on 2023-04-27.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe: Recipe
    @State private var pulsate: Bool = false
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack(alignment: .center, spacing: 0){
                Image(recipe.image)
                    .resizable()
                    .scaledToFit()
                
                //GROUP
                Group{
                    //TITLE
                    Text(recipe.title)
                        .font(.system(.largeTitle, design: .serif))
                        .bold()
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color("ColorGreenAdaptive"))
                    
                    //RATING
                    RecipeRatingView(rating: recipe.rating)
                    
                    //COOKING
                    RecipeCookingView(serves: recipe.serves, preparation: recipe.preparation, cooking: recipe.cooking)
                    
                    //INGREDIENTS
                    Text("Ingredients")
                        .modifier(titleModifier())
                    
                    VStack(alignment: .leading, spacing: 5) {
                        ForEach(recipe.ingredients, id: \.self){ingredient in
                            VStack(alignment: .leading, spacing: 5){
                                Text(ingredient)
                                    .font(.footnote)
                                    .multilineTextAlignment(.leading)
                                Divider()
                            }
                        }
                    }
                    
                    //INSTRUCTIONS
                    Text("Instructions")
                        .modifier(titleModifier())
                    
                    ForEach(recipe.instructions, id: \.self){ins in
                        VStack(alignment: .center, spacing: 5) {
                            Image(systemName: "chevron.down.circle")
                                .resizable()
                                .frame(width: 42, height: 42, alignment: .center)
                                .imageScale(.large)
                                .fontWeight(.ultraLight)
                                .foregroundColor(Color("ColorGreenAdaptive"))
                            
                            Text(ins)
                                .lineLimit(nil)
                                .multilineTextAlignment(.center)
                                .font(.system(.body, design: .serif))
                            .frame(minHeight: 100)
                        }
                        
                    }
                }
                .padding(.horizontal, 25)
                .padding(.vertical, 12)
            }
            
        }
        .edgesIgnoringSafeArea(.top)
        .overlay(
            HStack {
                Spacer()
                VStack {
                    Button(action: {
                        dismiss()
                    }, label: {
                        Image(systemName: "chevron.down.circle.fill")
                            .font(.title)
                            .foregroundColor(.pink)
                            .scaleEffect(pulsate ? 1.2 : 0.8)
                            .opacity(pulsate ? 1 : 0.6)
                            .animation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true), value: pulsate)
                })
                    .padding(.trailing, 24)
                    .padding(.top,20)
                    Spacer()
                }
            }
        )
        .onAppear(){
            pulsate = true
        }
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailView(recipe: recipesData[3])
    }
}
