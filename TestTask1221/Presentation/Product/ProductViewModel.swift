//
//  ProductViewModel.swift
//  TestTask1221
//
//  Created by Анастасия Талмазан on 2024-08-09.
//

import Foundation

class ProductViewModel: ObservableObject {
    @Published var productsCart: [Product] = []
    private var productUseCase: ProductUseCase

    init(useCase: ProductUseCase) {
        self.productUseCase = useCase
    }

    func addToCart(product: Product) async {
        if let newProduct = try? await productUseCase.addToCart(product: product) {
            DispatchQueue.main.async {
                self.productsCart.append(newProduct)
            }
        }
    }

    func removeFromCart(product: Product) async {
        if (try? await productUseCase.deleteFromCart(product: product)) ?? false {
            DispatchQueue.main.async {
                self.productsCart.removeAll { $0.id == product.id }
            }
        }
    }
}
