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
                .padding(.top, 8)
            Text("\(product.price) тг")
                .font(.subheadline)
                .padding(.top, 4)
            Button(action: {
                // Handle add to cart action
            }) {
                Text("Добавить в корзину")
            }
            .buttonStyle(BorderlessButtonStyle())
            .padding()
        }
        .background(Color.white)
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
