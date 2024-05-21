//
//  CartManager.swift
//  ArbuzTest2
//
//  Created by Димаш Алтынбек on 21.05.2024.
//

import Foundation
import Combine

class CartManager: ObservableObject {
    @Published var cartProducts: [Product] = [] {
        didSet {
            saveCartProducts()
        }
    }

    private let userDefaultsKey = "cartProducts"

    init() {
        loadCartProducts()
    }

    var totalCost: Double {
        cartProducts.reduce(0) { $0 + ($1.price * Double($1.quantity)) }
    }

    func addToCart(product: Product) {
        if let index = cartProducts.firstIndex(where: { $0.id == product.id }) {
            cartProducts[index].quantity += 1
        } else {
            var newProduct = product
            newProduct.quantity = 1
            cartProducts.append(newProduct)
        }
        cartProducts.removeAll { $0.quantity == 0 }
    }

    func removeFromCart(product: Product) {
        if let index = cartProducts.firstIndex(where: { $0.id == product.id }) {
            cartProducts[index].quantity -= 1
            if cartProducts[index].quantity == 0 {
                cartProducts.remove(at: index)
            }
        }
    }

    func updateCart(product: Product) {
        if let index = cartProducts.firstIndex(where: { $0.id == product.id }) {
            cartProducts[index].quantity = product.quantity
            if cartProducts[index].quantity == 0 {
                cartProducts.remove(at: index)
            }
        } else if product.quantity > 0 {
            cartProducts.append(product)
        }
    }

    private func saveCartProducts() {
        if let encoded = try? JSONEncoder().encode(cartProducts) {
            UserDefaults.standard.set(encoded, forKey: userDefaultsKey)
        }
    }

    private func loadCartProducts() {
        if let savedProducts = UserDefaults.standard.data(forKey: userDefaultsKey),
           let decodedProducts = try? JSONDecoder().decode([Product].self, from: savedProducts) {
            cartProducts = decodedProducts
        }
    }
}
