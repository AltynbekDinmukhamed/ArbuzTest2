//
//  ProductCardView.swift
//  ArbuzTest2
//
//  Created by Димаш Алтынбек on 19.05.2024.
//

import SwiftUI

struct ProductCardView: View {
    @Binding var product: Product
    @ObservedObject var cartManager: CartManager

    var body: some View {
        VStack {
            ZStack(alignment: .topTrailing) {
                Image(product.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Button(action: {
                    product.isLiked.toggle()
                }) {
                    Image(systemName: product.isLiked ? "heart.fill" : "heart")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundColor(product.isLiked ? .red : .gray)
                        .padding()
                }
            }
            Text(product.name)
                .font(.headline)
                .padding(.top, 8)
            Text("\(String(format: "%.2f", product.price)) тг")
                .font(.subheadline)
                .padding(.top, 4)

            ZStack {
                if product.quantity == 0 {
                    Button(action: {
                        product.quantity += 1
                        cartManager.addToCart(product: product)
                    }) {
                        Text("Добавить в корзину")
                            .frame(maxWidth: .infinity, maxHeight: 50)
                            .padding()
                            .font(.system(size: 15))
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                } else {
                    HStack(spacing: 20) {
                        Button(action: {
                            if product.quantity > 0 {
                                product.quantity -= 1
                                cartManager.removeFromCart(product: product)
                            }
                        }) {
                            Text("-")
                                .font(.title)
                                .frame(width: 30, height: 30)
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(15)
                        }
                        .buttonStyle(BorderlessButtonStyle())
                        
                        Text("\(product.quantity)")
                            .font(.headline)
                            .frame(width: 40)

                        Button(action: {
                            product.quantity += 1
                            cartManager.addToCart(product: product)
                        }) {
                            Text("+")
                                .font(.title)
                                .frame(width: 30, height: 30)
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(15)
                        }
                        .buttonStyle(BorderlessButtonStyle())
                    }
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .padding(5)
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                }
            }
            .frame(height: 50)
            .padding()
        }
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
        .padding()
    }
}

struct ProductCardView_Previews: PreviewProvider {
    @State static var product = sampleProduct
    @StateObject static var cartManager = CartManager()
    static var previews: some View {
        ProductCardView(product: $product, cartManager: cartManager)
    }
}
