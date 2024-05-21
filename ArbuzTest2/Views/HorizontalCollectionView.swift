//
//  HorizontalCollectionView.swift
//  ArbuzTest2
//
//  Created by Димаш Алтынбек on 19.05.2024.
//
import SwiftUI

struct HorizontalCollectionView: View {
    @Binding var products: [Product]
    @ObservedObject var cartManager: CartManager

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach($products) { $product in
                    NavigationLink(destination: ProductDetailView(productId: product.id)
                                    .environmentObject(cartManager)) {
                        ProductCardView(product: $product, cartManager: cartManager)
                            .frame(width: 250)
                    }
                }
            }
            .padding()
        }
    }
}

struct HorizontalCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalCollectionView(products: .constant(sampleProducts), cartManager: CartManager())
    }
}
