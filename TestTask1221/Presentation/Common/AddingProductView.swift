//
//  AddingProductView.swift
//  TestTask1221
//
//  Created by Анастасия Талмазан on 2024-08-08.
//

import SwiftUI

struct AddingProductView: View {
    
    var product: Product
    @Binding var isAddingToCartIsOpen: Bool
    
    @State var selectedAmountType: ProductAmountEnum = .weight
    @State var isAddedToCart: Bool =  true
    
    @State var currentAmountWeight: Double = 0.1
    @State var currentAmountPieces: Int = 1
    
    @State private var currentPrice: Double = 0
    
    
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
            
            if isAddedToCart {
                HStack(spacing: 0) {
                    // логика явно должна быть другой, учитывать в чем измеряется продукт, сколько вообще для каждого продукта будет прибалвение и убавления (например капусту в пятерочке когда добавляешь, там по 1.2 или 0.6 шаг. сделала этот момент тут скорее демонстрационным, но не до конца проработанным, посколько явно 1кг != 1 шт, а сейчас именно так и работает
                    Button {
                        if selectedAmountType == .weight && currentAmountWeight >= 0.2 {
                            currentAmountWeight -= 0.1
                            currentPrice = product.currentPrice * currentAmountWeight
                        } else if selectedAmountType == .piece && currentAmountPieces > 1 {
                            currentAmountPieces -= 1
                            currentPrice = product.currentPrice * Double(currentAmountPieces)
                        } else {
                            withAnimation {
                                isAddingToCartIsOpen = false
                            }
                        }
                    } label: {
                        Image("minusIcon")
                            .frame(width: 16, height: 16)

                    }
                    
                    Spacer()
                    
                    VStack(spacing: 2) {
                        if selectedAmountType == .weight {
                            Text("\(currentAmountWeight.formattedAsWeight()) кг")
                                .font(.custom("CeraRoundPro-Bold", size: 16))
                                .foregroundStyle(Color("TextStatic001"))
                        } else {
                            Text("\(currentAmountPieces) шт")
                                .font(.custom("CeraRoundPro-Bold", size: 16))
                                .foregroundStyle(Color("TextStatic001"))
                        }
                        
                        Text("~\(currentPrice.formattedAsPotentialPrice()) ₽")
                            .font(.caption)
                            .foregroundStyle(Color("TextStatic001").opacity(0.8))
                    }
                    
                    Spacer()
                    
                    Button {
                        if selectedAmountType == .weight {
                            currentAmountWeight += 0.1
                            currentPrice = product.currentPrice * currentAmountWeight
                        } else {
                            currentAmountPieces += 1
                            currentPrice = product.currentPrice * Double(currentAmountPieces)
                        }
                    } label: {
                        Image("plusIcon")
                            .frame(width: 16, height: 16)
                    }

                }
                .padding(EdgeInsets(top: 2,
                                    leading: 11,
                                    bottom: 2,
                                    trailing: 11))
                .background(
                    RoundedRectangle(cornerRadius: 40)
                        .fill(Color("Primary001"))
                )
            } else {
                
            }
            
        }
        .onAppear{
            if selectedAmountType == .piece {
                currentPrice = product.currentPrice * Double(currentAmountPieces)
            } else if selectedAmountType == .weight {
                currentPrice = product.currentPrice * currentAmountWeight
            }
        }
        .onChange(of: selectedAmountType) {
            if selectedAmountType == .piece {
                currentPrice = product.currentPrice * Double(currentAmountPieces)
            } else {
                currentPrice = product.currentPrice * currentAmountWeight
            }
        }
    }
}

struct AddingProductView_Previews: PreviewProvider {
    static var product = Product(id: 0,
                                        name: "Чипсы лейс с крабом",
                                        previousPrice: 199.0,
                                        currentPrice: 129.9,
                                        discount: nil,
                                        saleType: nil,
                                        rating: 5,
                                        reviewsAmount: 200,
                                        image: "product1",
                                        amountType: .both,
                                        country: nil)
    @State static var isAddingToCartIsOpen = true
    
    static var previews: some View {
        AddingProductView(product: product, 
                          isAddingToCartIsOpen: $isAddingToCartIsOpen)
    }
}
