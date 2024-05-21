//
//  MainView.swift
//  ArbuzTest2
//
//  Created by Димаш Алтынбек on 19.05.2024.
//

import SwiftUI

struct MainView: View {
    @State private var headerHeight: CGFloat = 200
    @State private var currentHeaderIndex = 0

    @State private var headers: [Product] = []
    @State private var products: [Product] = []
    
    @ObservedObject var cartManager: CartManager

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 0) {
                    CarouselView(headers: $headers, currentIndex: $currentHeaderIndex)
                        .frame(height: self.headerHeight)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .clipped()
                        .padding()
                        .onAppear {
                            loadProducts()
                            if !headers.isEmpty {
                                Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { timer in
                                    currentHeaderIndex = (currentHeaderIndex + 1) % headers.count
                                }
                            }
                        }

                    HorizontalCollectionView(products: $products, cartManager: cartManager)
                    VerticalCollectionView(products: $products, cartManager: cartManager)
                }
                .background(Color.white)
            }
            .navigationTitle("")
            .navigationBarHidden(true)
        }
    }

    private func loadProducts() {
        if let savedProducts = UserDefaults.standard.data(forKey: "products"),
           let decodedProducts = try? JSONDecoder().decode([Product].self, from: savedProducts) {
            self.headers = decodedProducts
            self.products = decodedProducts
        } else {
            self.headers = sampleProducts
            self.products = sampleProducts
            saveSampleProducts()
        }
    }

    private func saveSampleProducts() {
        if let encoded = try? JSONEncoder().encode(sampleProducts) {
            UserDefaults.standard.set(encoded, forKey: "products")
        }
    }
}

struct MainView_Previews: PreviewProvider {
    @StateObject static var cartManager = CartManager()
    static var previews: some View {
        MainView(cartManager: cartManager)
    }
}
