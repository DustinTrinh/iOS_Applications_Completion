//
//  Ticket.swift
//  MovieBooking
//
//  Created by DustyTheCutie on 2023-07-19.
//

import SwiftUI

struct Ticket: View {
    
    var gradient = [Color("cyan"), Color("cyan").opacity(0), Color("cyan").opacity(0)]
    @State var title = "Thor"
    @State var subtitle = "Love and Thunder"
    @State var topImg = "thor-top"
    @State var botImg = "thor-bottom"
    @Binding var height: CGFloat
    
    var body: some View {
        VStack(spacing:0){
            VStack(spacing: 4){
                Text(title)
                    .fontWeight(.bold)
                
                Text(subtitle)
            }
            .padding(EdgeInsets(top: 20, leading: 30, bottom: 0, trailing: 30))
            .frame(width: 250, height: 325, alignment: .top)
            .foregroundColor(.white)
            .background(
                Image(topImg)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            )
            .mask(
                Image(topImg)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            )
            .overlay{
                RoundedRectangle(cornerRadius: 40)
                    .stroke(LinearGradient(colors: gradient, startPoint: .topLeading, endPoint: .bottomTrailing), style: StrokeStyle(lineWidth: 2))
            }
            .cornerRadius(40, corners: [.topRight, .topLeft])
            
            Spacer(minLength: height)
            
            VStack(spacing: 10) {
                Line()
                    .stroke(style: StrokeStyle(lineWidth: 2, dash: [7]))
                    .frame(width: 200, height: 1)
                    .opacity(0.6)
                
                HStack(spacing: 20) {
                    HStack(spacing: 4) {
                        Text("Date:")
                            .fontWeight(.medium)
                            .foregroundColor(Color("lightPurple"))
                        Text("July 17")
                            .foregroundColor(.black)
                    }
                    HStack(spacing: 4) {
                        Text("Time:")
                            .fontWeight(.medium)
                            .foregroundColor(Color("lightPurple"))
                        Text("5:55 PM")
                            .foregroundColor(.black)
                    }
                }
                
                HStack(spacing: 20) {
                    HStack(spacing: 4) {
                        Text("Seats:")
                            .fontWeight(.medium)
                            .foregroundColor(Color("lightPurple"))
                        Text("2")
                            .foregroundColor(.black)
                    }
                    HStack(spacing: 4) {
                        Text("Row:")
                            .fontWeight(.medium)
                            .foregroundColor(Color("lightPurple"))
                        Text("G")
                            .foregroundColor(.black)
                    }
                }
                
                Image("code")
            }
            .frame(width: 250, height: 135, alignment: .top)
            .background(.ultraThinMaterial)
            .background(
                Image(botImg)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            )
            .mask(
                Image(botImg)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            )
        }
        .frame(height: 460)
        .font(.footnote)
        .shadow(radius: 10)
    }
}

struct Ticket_Previews: PreviewProvider {
    static var previews: some View {
        Ticket(height: .constant(0))
    }
}
