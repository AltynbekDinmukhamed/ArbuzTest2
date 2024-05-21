//
//  CartManager.swift
//  ArbuzTest2
//
//  Created by Димаш Алтынбек on 21.05.2024.
//

import Foundation

class CartManager: ObservableObject {
    @Published var cartProducts: [Product] = []
    
    var totalCost: Double {
        cartProducts.reduce(0) { $0 + ($1.price * Double($1.quantity)) }
    }
    
    func addToCart(product: Product) {
        if let index = cartProducts.firstIndex(where: { $0.id == product.id }) {
            cartProducts[index].quantity = product.quantity
        } else {
            cartProducts.append(product)
        }
    }
    
    func removeFromCart(product: Product) {
        if let index = cartProducts.firstIndex(where: { $0.id == product.id }) {
            if cartProducts[index].quantity == 0 {
                cartProducts.remove(at: index)
            } else {
                cartProducts[index].quantity = product.quantity
            }
        }
    }
    
    func updateCart(product: Product) {
        if let index = cartProducts.firstIndex(where: { $0.id == product.id }) {
            cartProducts[index].quantity = product.quantity
            if cartProducts[index].quantity == 0 {
                cartProducts.remove(at: index)
            }
        }
    }
}
