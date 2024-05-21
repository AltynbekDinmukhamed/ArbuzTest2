//
//  Product.swift
//  ArbuzTest2
//
//  Created by Димаш Алтынбек on 19.05.2024.
//

import Foundation

struct Product: Identifiable {
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
    Product(name: "Виноград", imageName: "grape", price: 800),
    Product(name: "Апельсины", imageName: "orange", price: 600)
]

class ProductRepository {
    func fetchProduct(by id: UUID, completion: @escaping (Product?) -> Void) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
            let product = sampleProducts.first { $0.id == id }
            DispatchQueue.main.async {
                completion(product)
            }
        }
    }
}
