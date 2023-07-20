//
//  BookingView.swift
//  MovieBooking
//
//  Created by DustyTheCutie on 2023-07-19.
//

import SwiftUI

struct BookingView: View {
    
    @State var gradient = [Color("backgroundColor2").opacity(0), Color("backgroundColor2"), Color("backgroundColor2"), Color("backgroundColor2")]
    @State var isSelected: Bool = false
    @State var bindingSelect: Bool = false
    @State var hourSelect: Bool = false
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            ZStack{
                Image("booking")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxHeight: .infinity, alignment: .top)
                
                VStack{
                    LinearGradient(colors: gradient, startPoint: .top, endPoint: .bottom)
                        .frame(height: 600)
                }
                .frame(maxHeight: .infinity, alignment: .bottom)
                
                VStack(spacing: 0.0) {
                    HStack{
                        CircleButton(action: {
                            dismiss()
                        }, image: "arrow.left")
                        
                        Spacer()
                        
                        CircleButton(action: {}, image: "ellipsis")
                    }
                    .padding(EdgeInsets(top: 46, leading: 20, bottom: 0, trailing: 20))
                    
                    Text("Doctor Strange")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.top, 200)
                    
                    Text("in the Multiverse of Madness")
                        .font(.title3)
                        .foregroundColor(.white)
                    
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Dui faucibus in ornare quam. Id interdum velit laoreet id donec. Id porta nibh venenatis cras sed felis eget...")
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .padding(30)
                    
                    Text("Select Date and Time")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    
                    HStack(alignment: .top, spacing: 20) {
                        
                        DateButton(weekDay: "Mon", numDay: "21", isSelected: $bindingSelect)
                            .padding(.top, 90)
                        DateButton(weekDay: "Tue", numDay: "22", isSelected: $bindingSelect)
                            .padding(.top, 70)
                        DateButton(weekDay: "Wed", numDay: "23", width: 70, height: 100, isSelected: $isSelected) {
                            withAnimation(.spring()){
                                isSelected.toggle()
                            }
                        }
                        .padding(.top, 30)
                        DateButton(weekDay: "Thu", numDay: "24", isSelected: $bindingSelect)
                            .padding(.top, 70)
                        DateButton(weekDay: "Fri", numDay: "25", isSelected: $bindingSelect)
                            .padding(.top, 90)
                    }
                    
                    HStack(alignment: .top, spacing: 20){
                        TimeButton(hour: "16:00", isSelected: $bindingSelect)
                            .padding(.top, 20)
                        
                        TimeButton(hour: "16:00", isSelected: $bindingSelect)
                        
                        TimeButton(hour: "16:00", width: 70, height: 40, isSelected: $hourSelect, action: {
                            withAnimation(.spring()){
                                hourSelect.toggle()
                            }
                        })
                        .padding(.top, -20)
                        TimeButton(hour: "16:00", isSelected: $bindingSelect)
                        TimeButton(hour: "16:00", isSelected: $bindingSelect)
                            .padding(.top, 20)
                    }
                    
                    NavigationLink {
                        SeatsView()
                    } label: {
                        LargeButton()
                            .padding(20)
                            .offset(y: isSelected && hourSelect ? 0 : 2000)
                            .disabled(!isSelected || !hourSelect)
                    }
                    
                    
                }
                .frame(maxHeight: .infinity, alignment: .top)
            }
            .background(Color("backgroundColor2"))
            .ignoresSafeArea()
        }
        .navigationBarBackButtonHidden(true)
        .edgesIgnoringSafeArea(.all
        )
    }
}

struct BookingView_Previews: PreviewProvider {
    static var previews: some View {
        BookingView()
    }
}
