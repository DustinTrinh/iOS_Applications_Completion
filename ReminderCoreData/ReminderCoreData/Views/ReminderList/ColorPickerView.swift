//
//  ColorPickerView.swift
//  ReminderCoreData
//
//  Created by DustyTheCutie on 2023-11-07.
//

import SwiftUI

struct ColorPickerView: View {
    
    @Binding var selectedColor: Color
    let colors: [Color] = [.red, .green, .blue, .yellow, .orange, .pink, .purple]
    
    var body: some View {
        HStack{
            ForEach(colors, id: \.self) {color in
                ZStack{
                    Circle().fill()
                        .foregroundStyle(color)
                        .padding(2)
                    
                    Circle()
                        .strokeBorder(selectedColor == color ? .gray : .clear, lineWidth: 4)
                        .scaleEffect(CGSize(width: 1.2, height: 1.2))
                }
                .onTapGesture {
                    selectedColor = color
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: 100)
        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
    }
    
}

#Preview {
    ColorPickerView(selectedColor: .constant(.red))
}
