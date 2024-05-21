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

    @State private var headers = [
        Product(name: "BBQ или гриль?", imageName: "steak", price: 2099.00),
        Product(name: "Бургер", imageName: "burger", price: 1500.00),
        Product(name: "Пицца", imageName: "pizza", price: 1200.00)
    ]

    @State private var products = [
        Product(name: "Яблоки", imageName: "apple", price: 500.00),
        Product(name: "Бананы", imageName: "banana", price: 300.00),
        Product(name: "Виноград", imageName: "grape", price: 800.00),
        Product(name: "Апельсины", imageName: "orange", price: 600.00)
    ]
    
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
                            Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { timer in
                                currentHeaderIndex = (currentHeaderIndex + 1) % headers.count
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
}

struct MainView_Previews: PreviewProvider {
    @StateObject static var cartManager = CartManager()
    static var previews: some View {
        MainView(cartManager: cartManager)
    }
}
