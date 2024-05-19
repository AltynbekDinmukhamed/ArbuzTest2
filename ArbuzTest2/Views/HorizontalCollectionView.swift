//
//  HorizontalCollectionView.swift
//  ArbuzTest2
//
//  Created by Димаш Алтынбек on 19.05.2024.
//

import SwiftUI

struct HorizontalCollectionView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(sampleProducts) { product in
                    ProductCardView(product: product)
                        .frame(width: 200)
                }
            }
            .padding()
        }
    }
}

struct HorizontalCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalCollectionView()
    }
}
