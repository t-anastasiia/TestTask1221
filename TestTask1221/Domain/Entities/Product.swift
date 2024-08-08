//
//  Product.swift
//  TestTask1221
//
//  Created by Анастасия Талмазан on 2024-08-07.
//

import Foundation
import SwiftUI

public struct Product: Identifiable, Hashable {
    public let id: Int
    public let name: String
    public let previousPrice: Double
    public let currentPrice: Double    
    public let discount: Int?
    public let saleType: PriceLabelsEnum?
    public let rating: Double
    public let reviewsAmount: Int
    public let image: String
    public let amountType: ProductAmountEnum
    public let country: CountryEnum?
    
    init(id: Int, 
         name: String,
         previousPrice: Double,
         currentPrice: Double,
         discount: Int?,
         saleType: PriceLabelsEnum?, 
         rating: Double,
         reviewsAmount: Int,
         image: String,
         amountType: ProductAmountEnum,
         country: CountryEnum?) {
        self.id = id
        self.name = name
        self.previousPrice = previousPrice
        self.currentPrice = currentPrice
        self.discount = discount
        self.saleType = saleType
        self.rating = rating
        self.reviewsAmount = reviewsAmount
        self.image = image
        self.amountType = amountType
        self.country = country
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    public static func == (lhs: Product, rhs: Product) -> Bool {
        return lhs.id == rhs.id
    }
}
