//
//  ProductLocalDataSource.swift
//  TestTask1221
//
//  Created by Анастасия Талмазан on 2024-08-09.
//

import Foundation

struct ProductLocalDataSource {
    
    private let userDefaults = UserDefaults.standard
    private let productsKey = "savedProducts"
    
    func setProducts(_ products: [Product]) {
        do {
            // Сериализация массива продуктов в JSON
            let data = try JSONEncoder().encode(products)
            // Сохранение закодированных данных в UserDefaults
            userDefaults.set(data, forKey: productsKey)
        } catch {
            print("Failed to encode products: \(error.localizedDescription)")
        }
    }
    
    func getProducts() -> [Product] {
        guard let data = UserDefaults.standard.data(forKey: productsKey) else {
            print("No data available in UserDefaults")
            return []
        }
        do {
            let products = try JSONDecoder().decode([Product].self, from: data)
            return products
        } catch {
            print("Failed to decode products: \(error)")
            return []
        }
    }
}
