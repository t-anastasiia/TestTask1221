//
//  ListProductView.swift
//  TestTask1221
//
//  Created by Анастасия Талмазан on 2024-08-07.
//

import SwiftUI

struct ListItemView: View {
    
    var product: Product
    
    @State var isLiked: Bool = false
    @State var selectedAmountType: ProductAmountEnum = .weight
    @State var isAddingToCartIsOpen = false
    
    var body: some View {
        HStack(spacing: 16) {
            imageView
            infoView
        }
        .frame(height: 144)
        .padding(.vertical, 20)
    }
}

extension ListItemView {
    var imageView: some View {
        Image(product.image)
            .resizable()
            .frame(width: 144, height: 144)
            .overlay(alignment: .topLeading) {
                if let sale = product.saleType {
                    Text(sale.rawValue)
                        .foregroundStyle(Color("TextStatic001"))
                        .font(.system(size: 10))
                        .padding(EdgeInsets(top: 2,
                                            leading: 12,
                                            bottom: 4,
                                            trailing: 6))
                        .background(RoundedCornerShape(tlRadius: 10,
                                                       trRadius: 6,
                                                       brRadius: 6,
                                                       blRadius: 0)
                            .fill(Color(product.saleType == .hitPrice ? "HitPrice001" : "NewProduct001"))
                        )
                }
            }
            .overlay(alignment: .bottomTrailing) {
                if let discount = product.discount {
                    Text("\(discount)%")
                        .font(.custom("CeraRoundPro-Bold", size: 16))
                        .foregroundStyle(Color("Additional004"))
                }
            }
    }
    var infoView: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                VStack(spacing: 6) {
                    ratingView
                    
                    HStack(spacing: 0) {
                        Text(product.name)
                            .font(.system(size: 12))
                            .foregroundStyle(Color("TextIcons003"))
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
                }
                
                ActionListView(isLiked: $isLiked)
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
    
    var ratingView: some View {
        HStack(spacing: 4) {
            Image("StarImage")
                .font(.system(size: 12))
            Divider()
                .frame(width: 1, height: 16)
                .foregroundStyle(Color("TextIcons003"))
            Text("\(product.reviewsAmount) отзывов")
                .font(.system(size: 12))
                .foregroundStyle(Color("TextIcons003"))
            Spacer()
        }
    }
}

struct ListProductView_Previews: PreviewProvider {
    static var product = Product(id: 1,
                                 name: "Огурцы тепличные cадово - огородные",
                                 previousPrice: 199.0,
                                 currentPrice: 120.90, 
                                 discount: 25,
                                 saleType: .hitPrice,
                                 rating: 4.1,
                                 reviewsAmount: 19,
                                 image: "product1", 
                                 amountType: .weight,
                                 country: .france)
    
    static var previews: some View {
        ListItemView(product: product)
    }
}
