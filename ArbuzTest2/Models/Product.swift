//
//  Product.swift
//  ArbuzTest2
//
//  Created by Димаш Алтынбек on 19.05.2024.
//

import Foundation

struct Product: Identifiable, Codable {
    var id: UUID
    var name: String
    var imageName: String
    var price: Double
    var quantity: Int
    var isLiked: Bool

    init(id: UUID = UUID(), name: String, imageName: String, price: Double, quantity: Int = 0, isLiked: Bool = false) {
        self.id = id
        self.name = name
        self.imageName = imageName
        self.price = price
        self.quantity = quantity
        self.isLiked = isLiked
    }
}

let sampleProduct = Product(name: "Яблоки", imageName: "apple", price: 500)
let sampleProducts = [
    Product(name: "Яблоки", imageName: "apple", price: 500),
    Product(name: "Бананы", imageName: "banana", price: 300),
    Product(name: "Виноград", imageName: "grape", price: 800),
    Product(name: "Апельсины", imageName: "orange", price: 600)
]
