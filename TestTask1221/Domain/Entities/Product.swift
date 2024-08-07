//
//  Product.swift
//  TestTask1221
//
//  Created by Анастасия Талмазан on 2024-08-07.
//

import Foundation
import SwiftUI

public struct Product {
    public let id: Int
    public let previousPrice: Double?
    public let currentPrice: Double    
    public let discount: Int?
    public let saleType: PriceLabelsEnum?
    public let rating: Double
    public let image: String
    
    init(id: Int, 
         previousPrice: Double?,
         currentPrice: Double,
         discount: Int?,
         saleType: PriceLabelsEnum?, 
         rating: Double,
         image: String) {
        self.id = id
        self.previousPrice = previousPrice
        self.currentPrice = currentPrice
        self.discount = discount
        self.saleType = saleType
        self.rating = rating
        self.image = image
    }
}
