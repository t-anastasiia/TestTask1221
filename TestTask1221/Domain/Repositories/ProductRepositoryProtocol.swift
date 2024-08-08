//
//  ProductsRepositoryProtocol.swift
//  TestTask1221
//
//  Created by Анастасия Талмазан on 2024-08-09.
//

import Foundation

protocol ProductRepositoryProtocol {
    func getCart() async throws -> [Product]
    func addToCart(product: Product) async throws -> Product?
    func deleteFromCart(product: Product) async throws -> Bool
}
