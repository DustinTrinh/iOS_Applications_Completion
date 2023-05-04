//
//  EmptyTodoView.swift
//  TodoList_CoreData
//
//  Created by DustyTheCutie on 2023-05-03.
//

import SwiftUI

struct EmptyTodoView: View {
    //MARK: - PROPERTIES
    @State private var isAnimated: Bool = false
    @ObservedObject var theme = ThemeSettings()
    var themes: [Theme] = themeData
    
    var body: some View {
        ZStack {
            VStack(alignment: .center, spacing: 20) {
                Image("\(images.randomElement() ?? images[0])")
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFit()
                    .layoutPriority(1)
                    .foregroundColor(themes[theme.themeSettings].themeColor)
                
                
                Text("Use your time wisely.")
                    .font(.system(.headline, design: .rounded))
                    .foregroundColor(themes[theme.themeSettings].themeColor)
            }
            .padding(.horizontal)
            .opacity(isAnimated ? 1 : 0)
            .offset(y: isAnimated ? 0 : -50)
            .animation(.easeOut(duration: 1), value: isAnimated)
            .onAppear {
                isAnimated.toggle()
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color("ColorBase"))
        .edgesIgnoringSafeArea(.all)
        
    }
}

struct EmptyTodoView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyTodoView()
            .environment(\.colorScheme, .light)
    }
}
