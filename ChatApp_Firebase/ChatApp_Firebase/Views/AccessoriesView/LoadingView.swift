//
//  LoadingView.swift
//  ChatApp_Firebase
//
//  Created by DustyTheCutie on 2023-06-29.
//

import SwiftUI

struct LoadingView: View {
    
    let message: String
    
    var body: some View {
        HStack(spacing: 10){
            ProgressView()
                .tint(.white)
            Text(message)
        }
        .padding(10)
        .background(.gray)
        .foregroundColor(.white)
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView(message: "Yo Yo Yp")
    }
}
