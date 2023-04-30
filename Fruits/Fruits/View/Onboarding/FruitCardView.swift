//
//  FruitCardView.swift
//  Fruits
//
//  Created by DustyTheCutie on 2023-04-18.
//

import SwiftUI

struct FruitCardView: View {
    //MARK: - PROPERTIES
    @State private var isAnimating: Bool = false
    var fruit: Fruit
    var body: some View {
        ZStack {
            VStack(spacing:20) {
                //Fruit Img
                Image(fruit.image)
                    .resizable()
                    .scaledToFit()
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 8, x: 6, y: 8)
                    .scaleEffect(isAnimating ? 1 : 0.5)
                
                //Fruit Title
                Text(fruit.title)
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 2, x: 2, y: 2)
                
                //Fruit Headline
                Text(fruit.headline)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 16)
                    .frame(maxWidth: 480)
                
                //Fruit Button
                StartButtonView()
                
            }//VSTACK
        }//:ZSTACK
        .onAppear{
            withAnimation(.easeOut(duration: 0.5)){
                isAnimating = true
            }
        }
        .onDisappear{
            isAnimating = false
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
        .background(LinearGradient(gradient: Gradient(colors: fruit.gradientColors), startPoint: .top, endPoint: .bottom))
        .cornerRadius(20)
        .padding(.horizontal, 20)
       
        //.ignoresSafeArea()
    }
    
}

struct FruitCardView_Previews: PreviewProvider {
    static var previews: some View {
        FruitCardView(fruit: fruitsData[1])
    }
}
