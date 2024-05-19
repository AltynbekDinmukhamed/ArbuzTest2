//
//  MainView.swift
//  ArbuzTest2
//
//  Created by Димаш Алтынбек on 19.05.2024.
//


import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    // Header
                    ProductCardView(product: sampleProduct)
                        .padding()
                    
                    // Collections
                    HorizontalCollectionView()
                    VerticalCollectionView()
                }
            }
            .navigationTitle("Главная")
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

