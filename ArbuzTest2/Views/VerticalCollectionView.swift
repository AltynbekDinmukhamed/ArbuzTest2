//
//  VerticalCollectionView.swift
//  ArbuzTest2
//
//  Created by Димаш Алтынбек on 19.05.2024.
//

import SwiftUI

struct VerticalCollectionView: View {
    @Binding var products: [Product]
    @ObservedObject var cartManager: CartManager

    var body: some View {
        LazyVGrid(columns: [GridItem(), GridItem()]) {
            ForEach($products) { $product in
                ProductCardView(product: $product, cartManager: cartManager)
                    .frame(width: 220)
            }
        }
        .padding(5)
    }
}

struct VerticalCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        VerticalCollectionView(products: .constant(sampleProducts), cartManager: CartManager())
    }
}
