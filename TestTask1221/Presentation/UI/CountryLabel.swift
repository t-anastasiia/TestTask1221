//
//  CountryLabel.swift
//  TestTask1221
//
//  Created by Анастасия Талмазан on 2024-08-09.
//

import Foundation

public func getCountryLabel(of country: CountryEnum) -> [String] {
    
    var countryName: String = ""
    var countryFlag: String = ""
    
    switch country {
        case .france:
            countryName = "Франция"
            countryFlag = "\u{1F1EB}\u{1F1F7}"
    }
    
    return [countryName, countryFlag]
}
