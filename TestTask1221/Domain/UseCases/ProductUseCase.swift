//
//  ProductUseCase.swift
//  TestTask1221
//
//  Created by Анастасия Талмазан on 2024-08-09.
//

import Foundation

protocol ProductUseCaseProtocol {
    func addToCart(product: Product) async throws -> Product?
    func deleteFromCart(product: Product) async throws -> Bool
}

struct ProductUseCase: ProductUseCaseProtocol {
    private let repository: ProductRepository
    
    init(repository: ProductRepository) {
        self.repository = repository
    }
    
    func addToCart(product: Product) async throws -> Product? {
        return try await repository.addToCart(product: product)
    }
    func deleteFromCart(product: Product) async throws -> Bool {
        do {
            try await repository.deleteFromCart(product: product)
            return true
        } catch {
            return false
        }
    }
}
