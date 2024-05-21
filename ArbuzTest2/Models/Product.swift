//
//  Product.swift
//  ArbuzTest2
//
//  Created by Димаш Алтынбек on 19.05.2024.
//

import Foundation

struct Product: Identifiable, Equatable {
    var id = UUID()
    var name: String
    var imageName: String
    var price: Double
    var quantity: Int = 0
    var isLiked: Bool = false
}

let sampleProduct = Product(name: "Яблоки", imageName: "apple", price: 500)
let sampleProducts = [
    Product(name: "Яблоки", imageName: "apple", price: 500),
    Product(name: "Бананы", imageName: "banana", price: 300),
]
