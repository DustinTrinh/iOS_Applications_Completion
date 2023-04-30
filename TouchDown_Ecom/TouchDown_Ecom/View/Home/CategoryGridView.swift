//
//  CategoryGridView.swift
//  TouchDown_Ecom
//
//  Created by DustyTheCutie on 2023-04-29.
//

import SwiftUI

struct CategoryGridView: View {
    
    private let categories: [Category] = categoriesData
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            LazyHGrid(rows: gridLayout, alignment: .center, spacing: columnSpacing, pinnedViews: []) {
                Section(
                    header: CategoryHeaderView(rotateClockWise: false),
                    footer: CategoryHeaderView(rotateClockWise: true)) {
                    ForEach(categories) { category in
                        CategoryItemView(category: category)
                    }
                }
            }
            .frame(height: 150)
            .padding(.horizontal, 15)
            .padding(.vertical, 10)
        }
    }
}

struct CategoryGridView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryGridView()
    }
}
