//
//  ProductCardView.swift
//  ArbuzTest2
//
//  Created by Димаш Алтынбек on 19.05.2024.
//

import SwiftUI

struct ProductCardView: View {
    var product: Product
    
    var body: some View {
        VStack {
            Image(product.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text(product.name)
                .font(.headline)
            Text("\(product.price) тг")
                .font(.subheadline)
            Button(action: {
                // Handle add to cart action
            }) {
                Text("Добавить в корзину")
            }
            .buttonStyle(BorderlessButtonStyle())
            .padding()
        }
        .background(Color(.systemGray6))
        .cornerRadius(10)
        .shadow(radius: 5)
        .padding()
    }
}

struct ProductCardView_Previews: PreviewProvider {
    static var previews: some View {
        ProductCardView(product: sampleProduct)
    }
}

