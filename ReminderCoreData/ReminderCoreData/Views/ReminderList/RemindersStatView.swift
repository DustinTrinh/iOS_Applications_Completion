//
//  RemindersStatView.swift
//  ReminderCoreData
//
//  Created by DustyTheCutie on 2023-12-03.
//

import SwiftUI

struct RemindersStatView: View {
    
    let icon: String
    let title: String
    var count: Int = 0
    var iconColor: Color = .blue
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack{
            HStack{
                VStack(alignment: .leading, spacing: 10) {
                    Image(systemName: icon)
                        .foregroundStyle(iconColor)
                        .font(.title)
                    Text(title)
                }
                
                Spacer()
                
                Text("\(count)")
                    .font(.largeTitle)
                
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(colorScheme == .dark ? Color.darkGray : Color.offWhite)
            .foregroundStyle(colorScheme == .dark ? Color.offWhite : Color.darkGray)
            .foregroundStyle(.white)
            .clipShape(RoundedRectangle(cornerRadius: 16.2, style: .continuous))
        }
    }
}

#Preview {
    RemindersStatView(icon: "calendar", title: "Today", count: 9)
}
