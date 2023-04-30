//
//  OnboardingView.swift
//  Fruits
//
//  Created by DustyTheCutie on 2023-04-18.
//

import SwiftUI

struct OnboardingView: View {
    
    var fruitsList: [Fruit] = fruitsData
    
    var body: some View {
        TabView{
            ForEach(fruitsList){ fruit in
                FruitCardView(fruit: fruit)
                
            }
            
        }
        .tabViewStyle(PageTabViewStyle())
        .padding(.vertical, 20)
        
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
