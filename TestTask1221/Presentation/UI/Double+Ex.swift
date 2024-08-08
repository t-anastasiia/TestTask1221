//
//  Double+Ex.swift
//  TestTask1221
//
//  Created by Анастасия Талмазан on 2024-08-08.
//

import Foundation

extension Double {
    func formattedAsWeight() -> String {
        let priceDouble = self
        
        let priceString = String(format: "%.1f", priceDouble)
        
        return priceString
    }
    
    func formattedAsPotentialPrice() -> String {
        let priceDouble = self
        
        let priceString = String(format: "%.2f", priceDouble)
        
        return priceString
    }
    
    func formattedAsPreviousPrice() -> String {
        let priceDouble = self
        
        if priceDouble.truncatingRemainder(dividingBy: 1.0) > 0.0 {
            return String(format: "%.2f", priceDouble)
        } else {
            return String(format: "%.1f", priceDouble)
        }
    }
    
    func formattedAsCurrentPrice() -> [String] {
        let priceDouble = self
        
        let fractionalPart = priceDouble - Double(Int(priceDouble))
        var partsOfPrice = [String]()
        
        if fractionalPart > 0.0 {
            partsOfPrice.append(String(Int(priceDouble)))
            partsOfPrice.append(String(format: "%.2f", fractionalPart).components(separatedBy: ".").last!)
        } else {
            partsOfPrice.append(String(Int(priceDouble)))
        }
        
        return partsOfPrice
    }
}
