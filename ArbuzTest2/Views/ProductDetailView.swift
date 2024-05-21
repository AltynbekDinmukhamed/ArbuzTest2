//
//  ProductDetailView.swift
//  ArbuzTest2
//
//  Created by Димаш Алтынбек on 19.05.2024.
//

import SwiftUI

struct ProductDetailView: View {
    @State var product: Product?
    
    var body: some View {
        VStack {
            if let product = product {
                Image(product.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Text(product.name)
                    .font(.headline)
                Text("\(product.price, specifier: "%.2f") тг")
                    .font(.subheadline)
                Button(action: {
                    // Handle add to cart action
                }) {
                    Text("Добавить в корзину")
                }
                .buttonStyle(BorderlessButtonStyle())
                .padding()
            } else {
                Text("Загрузка...")
            }
        }
        .padding()
        .onAppear {
            // Mock API call
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.product = sampleProduct
            }
        }
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(product: sampleProduct)
    }
}

