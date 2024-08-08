//
//  String+Ex.swift
//  TestTask1221
//
//  Created by Анастасия Талмазан on 2024-08-08.
//

import Foundation

extension String {
    func formattedAsEmoji() -> String {
        let code = self
        
        let scanner = Scanner(string: code)
        var emojis = ""
        
        while let value = scanner.scanInt(representation: .hexadecimal) {
            if let scalar = Unicode.Scalar(value) {
                emojis.append(Character(scalar))
            }
        }
        
        return emojis
    }
}
