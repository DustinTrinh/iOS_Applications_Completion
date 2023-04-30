//
//  ContentView.swift
//  TouchDown_Ecom
//
//  Created by DustyTheCutie on 2023-04-29.
//

import SwiftUI

struct ContentView: View {
    //MARK: - Properties
    @EnvironmentObject var shop: Shop
    
    var body: some View {
        ZStack {
            if shop.showingProduct == false && shop.selectedProduct == nil{
                VStack(spacing: 0) {
                    //MARK: - NAVIGATION BAR
                    NavigationBarView()
                        .padding(.horizontal, 15)
                        .padding(.bottom)
                        .background(.white)
                        .shadow(color: Color.black.opacity(0.05), radius: 5, x:0, y:5)
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: 0) {
                            FeaturedItemView()
                                .padding(.vertical, 20)
                            
                            CategoryGridView()
                            
                            TitleView(title: "HELMETS")
                            
                            
                            LazyVGrid(columns: gridLayout, spacing: 15) {
                                ForEach(productsData){prod in
                                    ProductItemView(product: prod)
                                        .onTapGesture {
                                            withAnimation(.easeOut){
                                                shop.selectedProduct = prod
                                                shop.showingProduct = true
                                            }
                                        }
                                }
                            }
                            .padding(15)
                            
                            TitleView(title: "BRANDS")
                            
                            BrandGridView()
                            
                            FooterView()
                                .padding(.horizontal)
                        }
                    }
                    
                    //MARK: - FOOTER
                    
                }
                .background(colorBackground.ignoresSafeArea(.all, edges: .all))
            } else {
                ProductDetailView(product: shop.selectedProduct!)
            }
        }
        //.ignoresSafeArea(.all, edges: .top)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Shop())
    }
}
