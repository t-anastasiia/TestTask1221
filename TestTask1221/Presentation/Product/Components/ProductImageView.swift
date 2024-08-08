//
//  ProductImageView.swift
//  TestTask1221
//
//  Created by Анастасия Талмазан on 2024-08-09.
//

import SwiftUI

struct ProductImageView: View {
    
    var image: String = "product0"
    var size: CGFloat = 144
    var saleType: PriceSaleEnum? = nil
    var discount: Int? = nil
    var reviewsAmount: Int = 0
    
    var showWithReviews: Bool = false
    
    var body: some View {
        Image(image)
            .resizable()
            .frame(width: size, height: size)
            .overlay(alignment: .topLeading) {
                if let sale = saleType {
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
                            .fill(Color(saleType == .hitPrice ? "HitPrice001" : "NewProduct001"))
                        )
                }
            }
            .overlay(alignment: .bottomTrailing) {
                if let discount = discount {
                    Text("\(discount)%")
                        .font(.custom("CeraRoundPro-Bold", size: 16))
                        .foregroundStyle(Color("Additional004"))
                }
            }
            .overlay(alignment: .bottomLeading) {
                if showWithReviews {
                    HStack(spacing: 8) {
                        Image("StarImage")
                            .font(.system(size: 12))
                            .frame(width: 1, height: 16)
                            .foregroundStyle(Color("TextIcons003"))
                        Text("\(reviewsAmount)")
                            .font(.system(size: 12))
                            .foregroundStyle(Color("TextIcons003"))
                        Spacer()
                    }
                    .padding(.leading, 6)
                }
            }
    }
}

#Preview {
    ProductImageView()
}
