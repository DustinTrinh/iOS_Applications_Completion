//
//  ProductDetailView.swift
//  TouchDown_Ecom
//
//  Created by DustyTheCutie on 2023-04-29.
//

import SwiftUI

struct ProductDetailView: View {
    
    var product: Product
    
    var body: some View {
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        let window = windowScene?.windows.first
        
        VStack(alignment: .leading, spacing: 5) {
            //MARK: - NAV
            NavigationBarDetailedView()
                .padding(.horizontal)
                .padding(.top, window?.safeAreaInsets.top)
                
            
            //MARK: - HEADER
            HeaderDetailView(productHeader: product.name)
                .padding(.horizontal)
                .padding(.vertical)
            
            //MARK: - Detail Top
            TopDetailView(price: product.formattedPrice, image: product.image)
                .padding(.horizontal)
                .zIndex(1)
            
            //MARK: - Detail Bot
            VStack(alignment: .center, spacing: 0) {
                
                //MARK: - Ratings & Sizes
                RatingsAndSizesView()
                    .padding(.top, -20)
                    .padding(.bottom, 10)
                
                //MARK: - DESCRIPTION
                ScrollView(.vertical, showsIndicators: false){
                    Text(product.description)
                        .font(.system(.body, design: .rounded))
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.leading)
                }
                //MARK: - Quantity & Fav
                QuantityAndFavView()
                    .padding(.vertical, 20)
                
                //MARK: - Add to Cart
                AddToCartDetailView(r: product.red, g: product.green, b: product.blue)
                    .padding(.bottom, 20)

            }
            .padding(.horizontal)
            .background(
                Color.white.clipShape(CustomShape())
                    .padding(.top, -105)
            )
            .ignoresSafeArea(.all)
            
                        
            
            
            Spacer()
        }
        .zIndex(0)
        .ignoresSafeArea(.all,edges: .all)
        .background(Color(red: product.red, green: product.green, blue: product.blue))
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(product: productsData[2])
    }
}
