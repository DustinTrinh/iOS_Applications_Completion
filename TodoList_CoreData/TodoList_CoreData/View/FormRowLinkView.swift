//
//  FormRowLinkView.swift
//  TodoList_CoreData
//
//  Created by DustyTheCutie on 2023-05-04.
//

import SwiftUI

struct FormRowLinkView: View {
    //MARK: - PROPERTIES
    
    var icon: String
    var color: Color
    var text: String
    var link: String
    
    var body: some View {
        HStack {
            
            ZStack{
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .fill(color)
                Image(systemName: icon)
                    .imageScale(.large)
                    .foregroundColor(.white)
            }
            .frame(width: 36, height: 36, alignment: .center)
            
            Text(text)
                .foregroundColor(.gray)
            
            Spacer()
            
            Button {
                guard let url = URL(string: link), UIApplication.shared.canOpenURL(url) else{
                    return
                }
                UIApplication.shared.open(url as URL)
                
            } label: {
                Image(systemName: "chevron.right")
                    .font(.system(size: 15, weight: .semibold, design: .rounded))
            }
            //tint(Color(.systemGray2))
        }
        .padding(.top, 5)
        .padding(.bottom, 5)
    }
}

struct FormRowLinkView_Previews: PreviewProvider {
    static var previews: some View {
        FormRowLinkView(icon: "gear", color: .red, text: "Text", link: "google.ca")
    }
}
