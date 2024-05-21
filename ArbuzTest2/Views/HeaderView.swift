//
//  ContentView.swift
//  ArbuzTest2
//
//  Created by Димаш Алтынбек on 19.05.2024.
//

import SwiftUI

struct HeaderView: View {
    @Binding var product: Product

    var body: some View {
        VStack {
            Image(product.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
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
                    }) {
                        Text("Добавить в корзину")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                } else {
                    HStack(spacing: 20) {
                        Button(action: {
                            if product.quantity > 0 {
                                product.quantity -= 1
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
                        }) {
                            Text("+")
                                .font(.title)
                                .frame(width: 30, height: 30)
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(15)
                        }
                        .buttonStyle(BorderlessButtonStyle())
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                }
            }
            .frame(height: 50)  // Задаем фиксированную высоту
            .padding()
        }
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
        .padding(.horizontal)
    }
}

struct HeaderView_Previews: PreviewProvider {
    @State static var product = sampleProduct
    static var previews: some View {
        HeaderView(product: $product)
    }
}
