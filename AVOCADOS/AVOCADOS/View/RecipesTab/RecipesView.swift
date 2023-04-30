//
//  RecipesView.swift
//  AVOCADOS
//
//  Created by DustyTheCutie on 2023-04-25.
//

import SwiftUI
import SwiftUI

struct RecipesView: View {
    
    private let headers: [Header] = headersData
    private let facts: [Fact] = factsData
    private let recipes: [Recipe] = recipesData
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack {
                //HEADER
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(alignment: .top, spacing: 0) {
                        ForEach(headers){ header in
                            HeaderView(header: header)
                        }
                    }
                }
                
                //DISHES
                Text("Avocado Dishes")
                    .modifier(titleModifier())
                DishesView()
                
                //FACTS
                Text("Avocado Facts")
                    .modifier(titleModifier())
                
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(alignment: .top, spacing: 60) {
                        ForEach(facts) { fact in
                            FactsView(fact: fact)
                        }
                    }
                    .padding(.vertical)
                    .padding(.leading, 60)
                    .padding(.trailing, 20)
                }
                
                //RECIPES
                Text("Avocado Recipes")
                    .modifier(titleModifier())
                VStack(alignment: .center, spacing: 20) {
                    ForEach(recipes) { recipe in
                        RecipeCardView(recipe: recipe)
                    }
                }
                
                
                //Footer
                VStack(alignment: .center, spacing: 10){
                    Text("All About Avocados")
                        .modifier(titleModifier())
                    
                    Text("Everything you want to know about Avocados but were too afraid to ask.")
                        .font(.system(.body, design: .serif))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.gray)
                        
                }
                .frame(maxWidth: 340)
                .padding(0)
                .padding(.bottom, 85)
            }
            
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct titleModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .font(.system(.title, design: .serif))
            .fontWeight(.bold)
            .foregroundColor(Color("ColorGreenAdaptive"))
            .padding(8)
    }
}

struct RecipesView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesView()
    }
}
