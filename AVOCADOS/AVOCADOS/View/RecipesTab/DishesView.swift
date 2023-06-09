//
//  DishesView.swift
//  AVOCADOS
//
//  Created by DustyTheCutie on 2023-04-26.
//

import SwiftUI

struct DishesView: View {
    var body: some View {
        HStack (alignment: .center, spacing: 4){
            VStack(alignment: .leading, spacing: 4){
                HStack{
                    Image("icon-toasts")
                        .resizable()
                        .modifier(iconModifier())
                    Spacer()
                    Text("Toasts")
                }
                Divider()
                HStack{
                    Image("icon-tacos")
                        .resizable()
                        .modifier(iconModifier())
                    Spacer()
                    Text("Tacos")
                }
                Divider()
                HStack{
                    Image("icon-salads")
                        .resizable()
                        .modifier(iconModifier())
                    Spacer()
                    Text("Salads")
                }
                Divider()
                HStack{
                    Image("icon-halfavo")
                        .resizable()
                        .modifier(iconModifier())
                    Spacer()
                    Text("Spreads")
                }
            }
            
            VStack(alignment: .center, spacing: 16) {
                HStack{
                    Divider()
                }
                
                Image(systemName: "heart.circle")
                    .font(Font.title.weight(.light))
                    .imageScale(.large)
                
                HStack{
                    Divider()
                }
            }
            
            VStack(alignment: .trailing, spacing: 4){
                HStack{
                    Text("Guacamole")
                    Spacer()
                    Image("icon-guacamole")
                        .resizable()
                        .modifier(iconModifier())
                }
                Divider()
                HStack{
                    Text("Sandwiches")
                    Spacer()
                    Image("icon-sandwiches")
                        .resizable()
                        .modifier(iconModifier())
                }
                Divider()
                HStack{
                    Text("Soups")
                    Spacer()
                    Image("icon-soup")
                        .resizable()
                        .modifier(iconModifier())
                }
                Divider()
                HStack{
                    Text("Smoothies")
                    Spacer()
                    Image("icon-smoothies")
                        .resizable()
                        .modifier(iconModifier())
                }
            }
        }
        .font(.system(.callout, design: .serif))
        .foregroundColor(.gray)
        .padding(.horizontal)
        .frame(maxHeight: 220)
    }
}

struct iconModifier: ViewModifier{
    func body(content: Content) -> some View{
        content
            .frame(width: 42, height: 42, alignment: .center)
    }
}

struct DishesView_Previews: PreviewProvider {
    static var previews: some View {
        DishesView()
    }
}
