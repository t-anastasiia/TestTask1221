//
//  PriceView.swift
//  TestTask1221
//
//  Created by Анастасия Талмазан on 2024-08-08.
//

import SwiftUI

struct PriceView: View {
    
    var product: Product
    @Binding var isAddingToCartIsOpen: Bool
    @Binding var selectedAmountType: ProductAmountEnum
    
    var body: some View {
        VStack(spacing: 10) {
            if product.amountType == .both {
                Picker("Выберите тип", selection: $selectedAmountType) {
                    Text("Шт").tag(ProductAmountEnum.piece)
                    Text("Кг").tag(ProductAmountEnum.weight)
                }
                    .pickerStyle(.segmented)
                    .frame(height: 28)
            }
            
            HStack(spacing: 0) {
                VStack(spacing: 0) {
                    HStack(spacing: 2) {
                        Text("\(product.currentPrice.formattedAsCurrentPrice()[0])")
                            .font(.custom("CeraRoundPro-Bold", size: 20))
                            .foregroundStyle(Color("TextIcons001"))
                        if product.currentPrice.formattedAsCurrentPrice().count == 2 {
                            Text("\(product.currentPrice.formattedAsCurrentPrice()[1])")
                                .font(.custom("CeraRoundPro-Bold", size: 16))
                                .foregroundStyle(Color("TextIcons001"))
                        }
                        Image("rubleIcon")
                            .padding(.bottom, 6)
                        Image("linePriceIcon")
                            .padding(.leading, -6)
                        Image("kgIcon")
                            .padding(.top, 6)
                            .padding(.leading, -6)
                        Spacer()
                    }
                    HStack {
                        Text("\(product.previousPrice.formattedAsPreviousPrice())")
                            .font(.system(size: 12))
                            .strikethrough()
                            .foregroundStyle(Color("TextIcons003"))
                        Spacer()
                    }
                }
                
                Spacer()
                
                Button {
                    withAnimation {
                        isAddingToCartIsOpen = true
                    }
                } label: {
                    Image("cartIcon")
                        .frame(width: 16, height: 16)
                        .padding(EdgeInsets(top: 10,
                                            leading: 16,
                                            bottom: 10,
                                            trailing: 16))
                        .background(
                            RoundedRectangle(cornerRadius: 40)
                                .fill(Color("Primary001"))
                        )
                }
            }
        }
    }
}

struct PriceView_Previews: PreviewProvider {
    static var product = Product(id: 0,
                                 name: "чипсеки",
                                 previousPrice: 199.0,
                                 currentPrice: 1.0,
                                 discount: 99,
                                 saleType: .hitPrice,
                                 rating: 5,
                                 reviewsAmount: 120,
                                 image: "product0",
                                 amountType: .both,
                                 country: nil)
    @State static var isAddingToCartIsOpen = false
    @State static var selectedAmountType: ProductAmountEnum = .both
    
    static var previews: some View {
        PriceView(product: product,
                  isAddingToCartIsOpen: $isAddingToCartIsOpen,
                  selectedAmountType: $selectedAmountType)
    }
    
}
