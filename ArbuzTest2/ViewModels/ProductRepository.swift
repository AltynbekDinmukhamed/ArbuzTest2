//
//  ProductRepository.swift
//  ArbuzTest2
//
//  Created by Димаш Алтынбек on 21.05.2024.
//

import Foundation

class ProductRepository {
    static func fetchProduct(by id: UUID, completion: @escaping (Product?) -> Void) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
            if let savedProducts = UserDefaults.standard.data(forKey: "products"),
               let decodedProducts = try? JSONDecoder().decode([Product].self, from: savedProducts) {
                let product = decodedProducts.first(where: { $0.id == id })
                DispatchQueue.main.async {
                    completion(product)
                }
            } else {
                DispatchQueue.main.async {
                    completion(nil)
                }
            }
        }
    }
}
