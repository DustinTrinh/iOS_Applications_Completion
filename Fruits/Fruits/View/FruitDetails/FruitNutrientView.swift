//
//  FruitNutrientView.swift
//  Fruits
//
//  Created by DustyTheCutie on 2023-04-20.
//

import SwiftUI

struct FruitNutrientView: View {
    
    //MARK: - PROPERTIES
    var fruit: Fruit
    var nutrients: [String] = ["Energy", "Sugar", "Fat", "Protein", "Vitamins", "Minerals"]
    
    
    var body: some View {
        GroupBox(){
            DisclosureGroup("Nutritional value (per 100g)"){
                ForEach(0..<nutrients.count, id: \.self){ f in
                    Divider()
                        .padding(.vertical, 2)
                    HStack {
                        Group {
                            Image(systemName: "info.circle")
                            Text(nutrients[f])
                        }
                        .foregroundColor(fruit.gradientColors[1])
                        .font(.system(.body).bold())
                        
                        Spacer(minLength: 25)
                        
                        Text(fruit.nutrition[f])
                            .multilineTextAlignment(.trailing)
                            
                    }
                    
                }
            }
            
        }//BOX
        
    }
}

struct FruitNutrientView_Previews: PreviewProvider {
    static var previews: some View {
        FruitNutrientView(fruit: fruitsData[0])
    }
}
