//
//  PreviewImgView.swift
//  ChatApp_Firebase
//
//  Created by DustyTheCutie on 2023-06-28.
//

import SwiftUI

struct PreviewImgView: View {
    
    let selectedImg: UIImage
    var onCancel: () -> Void
    
    var body: some View {
        ZStack {
            Image(uiImage: selectedImg)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .overlay(alignment: .top) {
                    Button {
                        onCancel()
                    } label: {
                        Image(systemName: "multiply.circle.fill")
                            .padding([.top], 10)
                            .font(.largeTitle)
                            .foregroundColor(.white)
                        
                    }

                }
        }
    }
}

/*
struct PreviewImgView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewImgView()
    }
}
*/
