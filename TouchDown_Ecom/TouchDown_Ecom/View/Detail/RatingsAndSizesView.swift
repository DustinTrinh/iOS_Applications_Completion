//
//  RatingsAndSizesView.swift
//  TouchDown_Ecom
//
//  Created by DustyTheCutie on 2023-04-30.
//

import SwiftUI

struct RatingsAndSizesView: View {
    
    private let sizes: [String] = sizesData
    
    var body: some View {
        HStack(alignment: .top, spacing: 3) {
            //MARK: - Ratings
            VStack(alignment: .leading, spacing: 3) {
                Text("Ratings")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
                
                HStack(alignment: .center, spacing: 5) {
                    ForEach(1...5, id: \.self){star in
                        Button {
                            //
                        } label: {
                            Image(systemName: "star.fill")
                                .frame(width: 25, height: 25, alignment: .center)
                                .background(colorGray.cornerRadius(5))
                                .foregroundColor(.white)
                        }

                    }
                }
            }
            
            
            Spacer()
            
            //MARK: - Sizes
            VStack(alignment: .trailing, spacing: 3) {
                Text("Sizes")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
                
                HStack(alignment: .center, spacing: 5) {
                    ForEach(sizes, id:\.self){size in
                        Button {
                            //
                        } label: {
                            Text(size)
                                .font(.footnote)
                                .fontWeight(.heavy)
                                .frame(width: 25, height: 25, alignment: .center)
                                .background(Color.white.cornerRadius(5))
                                .background(
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(colorGray, lineWidth: 2)
                                )
                                .foregroundColor(colorGray)
                        }

                    }
                }
            }
        }
    }
}

struct RatingsAndSizesView_Previews: PreviewProvider {
    static var previews: some View {
        RatingsAndSizesView()
    }
}
