//
//  SettingRowView.swift
//  Fruits
//
//  Created by DustyTheCutie on 2023-04-20.
//

import SwiftUI

struct SettingRowView: View {
    
    var name: String
    var content: String? = nil
    var linkLabel: String? = nil
    var linkDestination: String? = nil
    
    var body: some View {
        
        VStack {
            Divider().padding(.vertical, 5)
            HStack(alignment: .center, spacing: 10) {
                
                Text(name)
                    .foregroundColor(.gray)
                Spacer()
                if (content != nil){
                    Text(content!)
                }
                else if(linkLabel != nil && linkDestination != nil){
                    Link(linkLabel!, destination: URL(string: "\(linkDestination!)")!)
                    Image(systemName: "link")
                        .foregroundColor(.pink)
                }
                else{
                    EmptyView()
                }
                
                    
            }
        }
    }
}

struct SettingRowView_Previews: PreviewProvider {
    static var previews: some View {
        SettingRowView(name: "Developer", content: "Dustin Trinh")
    }
}
