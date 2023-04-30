//
//  RippeningStages.swift
//  AVOCADOS
//
//  Created by DustyTheCutie on 2023-04-25.
//

import SwiftUI

struct RippeningStages: View {
    
    private let ripeningsData: [Ripening] = ripeningData
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            VStack {
                HStack(alignment: .center, spacing: 25) {
                    ForEach(ripeningsData) { data in
                        RipeningView(ripening: data)
                    }
                }
            }
            .padding(.vertical)
            .padding(.horizontal)
            Spacer()
        }
    }
}

struct RippeningStages_Previews: PreviewProvider {
    static var previews: some View {
        RippeningStages()
    }
}
