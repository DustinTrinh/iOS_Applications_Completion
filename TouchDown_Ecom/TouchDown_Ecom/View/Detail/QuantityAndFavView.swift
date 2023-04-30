//
//  QuantityAndFavView.swift
//  TouchDown_Ecom
//
//  Created by DustyTheCutie on 2023-04-30.
//

import SwiftUI

struct QuantityAndFavView: View {
    @State private var counter: Int = 0
    
    var body: some View {
        HStack(alignment: .center, spacing: 6) {
            Button {
                
                if(counter <= 0){
                    counter = 0
                }
                else{
                    counter -= 1
                }
            } label: {
                Image(systemName: "minus.circle")
            }
            
            Text("\(counter)")
                .fontWeight(.semibold)
            
            Button {
                counter += 1
            } label: {
                Image(systemName: "plus.circle")
            }
            
            Spacer()
            
            Button {
                //
            } label: {
                Image(systemName: "heart.circle")
                    .foregroundColor(.pink)
            }

        }
        .font(.system(.title, design: .rounded))
        .foregroundColor(.black)
        .imageScale(.large)
    }
}

struct QuantityAndFavView_Previews: PreviewProvider {
    static var previews: some View {
        QuantityAndFavView()
    }
}
