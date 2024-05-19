//
//  VerticalCollectionView.swift
//  ArbuzTest2
//
//  Created by Димаш Алтынбек on 19.05.2024.
//

import SwiftUI

struct VerticalCollectionView: View {
    var body: some View {
        LazyVGrid(columns: [GridItem(), GridItem()]) {
            ForEach(sampleProducts) { product in
                ProductCardView(product: product)
            }
        }
        .padding()
    }
}

struct VerticalCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        VerticalCollectionView()
    }
}
