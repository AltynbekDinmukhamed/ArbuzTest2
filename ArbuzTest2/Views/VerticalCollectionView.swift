//
//  VerticalCollectionView.swift
//  ArbuzTest2
//
//  Created by Димаш Алтынбек on 19.05.2024.
//

import SwiftUI

struct VerticalCollectionView: View {
    @Binding var products: [Product]

    var body: some View {
        LazyVGrid(columns: [GridItem(), GridItem()]) {
            ForEach($products) { $product in
                ProductCardView(product: $product)
                    .frame(width: 220)
            }
        }
    }
}

struct VerticalCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        VerticalCollectionView(products: .constant(sampleProducts))
    }
}
