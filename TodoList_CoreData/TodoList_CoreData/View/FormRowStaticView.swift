//
//  FormRowStaticView.swift
//  TodoList_CoreData
//
//  Created by DustyTheCutie on 2023-05-04.
//

import SwiftUI

struct FormRowStaticView: View {
    //MARK: - PROPERTIES
    var icon: String
    var first: String
    var second: String
    
    var body: some View {
        HStack {
            
            ZStack{
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .fill(.gray)
                Image(systemName: icon)
                    .foregroundColor(.white)
            }
            .frame(width: 36, height: 36)
            
            Text(first)
                .foregroundColor(.gray)
            
            Spacer()
            
            Text(second)
            
        }
        .padding(.top, 5)
        .padding(.bottom, 5)
    }
}

struct FormRowStaticView_Previews: PreviewProvider {
    static var previews: some View {
        FormRowStaticView(icon: "gear", first: "First", second: "Second")
    }
}
