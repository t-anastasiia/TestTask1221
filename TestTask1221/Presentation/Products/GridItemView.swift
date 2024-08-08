//
//  GridProductView.swift
//  TestTask1221
//
//  Created by Анастасия Талмазан on 2024-08-07.
//

import SwiftUI

struct GridItemView: View {
    
    var product: Product
    
    @State private var isAddingToCartIsOpen = false
    @State private var selectedAmountType: ProductAmountEnum = .weight
    @State private var isLiked = false
    
    var body: some View {
        VStack(spacing: 10) {
            ProductImageView(image: product.image,
                             size: 168,
                             saleType: product.saleType,
                             discount: product.discount,
                             reviewsAmount: product.reviewsAmount,
                             showWithReviews: true)
            .clipShape(
                RoundedCornerShape(tlRadius: 16,
                                   trRadius: 16,
                                   brRadius: 0,
                                   blRadius: 0)
            )
            .overlay(alignment: .topTrailing) {
                ActionListView(isLiked: $isLiked)
            }
            infoView
                .padding(EdgeInsets(top: 0,
                                    leading: 6,
                                    bottom: 4,
                                    trailing: 4))
        }
        .frame(width: 168, height: 278)
        .background(
            RoundedCornerShape(tlRadius: 16,
                               trRadius: 16,
                               brRadius: 20,
                               blRadius: 20)
            .fill(Color("TextStatic001"))
        )
        .compositingGroup()
        .shadow(color: Color("ShadowColor001"), radius: 8, x: 0, y: 0)
    }
}

extension GridItemView {
    var infoView: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Text(product.name)
                    .font(.system(size: 12))
                    .foregroundStyle(Color("TextIcons002"))
                    .multilineTextAlignment(.leading)
                    .frame(alignment: .leading)
                
                Spacer()
            }
            
            if let country = product.country {
                HStack(spacing: 4) {
                    Text("\(getCountryLabel(of: country)[0])")
                        .font(.system(size: 12))
                        .foregroundStyle(Color("TextIcons003"))
                    Text("\(getCountryLabel(of: country)[1])")
                        .font(.system(size: 15))
                    Spacer()
                }
            }
            
            Spacer()
            
            if isAddingToCartIsOpen {
                AddingProductView(product: product,
                                  isAddingToCartIsOpen: $isAddingToCartIsOpen)
            } else {
                PriceView(product: product,
                          isAddingToCartIsOpen: $isAddingToCartIsOpen,
                          selectedAmountType: $selectedAmountType)
            }
        }
    }
}

struct GridItemView_Previews: PreviewProvider {
    static var product = Product(id: 1,
                                 name: "чипсеки",
                                 previousPrice: 1232.1,
                                 currentPrice: 12.2,
                                 discount: nil,
                                 saleType: nil,
                                 rating: 5,
                                 reviewsAmount: 100,
                                 image: "product1",
                                 amountType: .piece,
                                 country: nil)
    
    static var previews: some View {
        GridItemView(product: product)
    }
}
