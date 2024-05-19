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

    let headers = [
        Product(name: "BBQ или гриль?", imageName: "steak", price: 2099),
        Product(name: "Бургер", imageName: "burger", price: 1500),
        Product(name: "Пицца", imageName: "pizza", price: 1200)
    ]

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 0) {
                    CarouselView(headers: headers, currentIndex: $currentHeaderIndex)
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

                    HorizontalCollectionView()
                    VerticalCollectionView()
                }
                .background(Color.white)
            }
            .navigationTitle("Home")
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
