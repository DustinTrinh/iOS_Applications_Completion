//
//  AvocadosView.swift
//  AVOCADOS
//
//  Created by DustyTheCutie on 2023-04-25.
//

import SwiftUI

struct AvocadosView: View {
    @State private var isAnimating: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            Image("avocado")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 240, height: 240, alignment: .center)
                .shadow(color: Color("ColorBlackTransparentDark"), radius: 12, x: 0, y: 8)
                .scaleEffect(isAnimating ? 1 : 0.8)
                .opacity(isAnimating ? 1 : 0.8)
                .animation(Animation.easeInOut(duration: 1.0).repeatForever(autoreverses: true), value: isAnimating)
            
            VStack {
                Text("Avocado".uppercased())
                    .font(.system(size: 42,weight: .bold, design: .serif))
                    .foregroundColor(.white)
                    .padding()
                .shadow(color: Color("ColorBlackTransparentDark"), radius: 4, x: 0, y: 4)
                
                Text("""
                    Creamy, green, and full of nutrients!
                    Avocado is a powerhouse ingredient at any meal.
                    Enjoy these handpicked avocado recipes for breakfast, lunch, dinner & more!
                    """)
                    .multilineTextAlignment(.center)
                    .font(.system(.headline, design: .serif))
                    .foregroundColor(.white)
                    .lineSpacing(8)
                    .frame(maxWidth: 640, minHeight: 120)
            }
            .padding()
            Spacer()
        }
        .background(
            Image("background")
                .resizable()
                .aspectRatio(contentMode: .fill)
        )
        .edgesIgnoringSafeArea(.top)
        .onAppear(perform: {
            isAnimating = true
        })
        .onDisappear(perform: {
            isAnimating = false
        })
    }
}

struct AvocadosView_Previews: PreviewProvider {
    static var previews: some View {
        AvocadosView()
    }
}
