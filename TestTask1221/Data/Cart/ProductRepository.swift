//
//  ProductRepository.swift
//  TestTask1221
//
//  Created by Анастасия Талмазан on 2024-08-09.
//

import Foundation

struct ProductRepository: ProductRepositoryProtocol {
    private let localDataSource: ProductLocalDataSource
    
    init(localDataSource: ProductLocalDataSource) {
        self.localDataSource = localDataSource
    }
    
    func getCart() async throws -> [Product] {
        return localDataSource.getProducts()
    }
    
    func addToCart(product: Product) async throws -> Product? {
        var products = localDataSource.getProducts()
        print("Current products before adding: \(products.map { $0.name })")
        if !products.contains(product) {
            products.append(product)
            localDataSource.setProducts(products)
            print("Product added, new products list: \(products.map { $0.name })")
            return product
        } else {
            print("Product not added because it already exists")
            return nil
        }
    }

    func deleteFromCart(product: Product) async throws -> Bool {
        var products = localDataSource.getProducts()
        print("Current products before deleting: \(products.map { $0.name })")
        if let index = products.firstIndex(of: product) {
            products.remove(at: index)
            localDataSource.setProducts(products)
            print("Product removed, new products list: \(products.map { $0.name })")
            return true
        } else {
            print("Product not found for removal")
            return false
        }
    }
}
