//
//  CartView.swift
//  ArbuzTest2
//
//  Created by Димаш Алтынбек on 19.05.2024.
//

import SwiftUI

struct CartView: View {
    @ObservedObject var cartManager: CartManager
    @State private var isCheckingOut = false
    @State private var showingCheckoutScreen = false

    var body: some View {
        VStack {
            List {
                ForEach(cartManager.cartProducts.indices, id: \.self) { index in
                    HStack {
                        Image(cartManager.cartProducts[index].imageName)
                            .resizable()
                            .frame(width: 50, height: 50)
                            .aspectRatio(contentMode: .fit)
                        VStack(alignment: .leading) {
                            Text(cartManager.cartProducts[index].name)
                                .font(.headline)
                            Text("\(String(format: "%.2f", cartManager.cartProducts[index].price * Double(cartManager.cartProducts[index].quantity))) тг")
                                .font(.subheadline)
                        }
                        Spacer()
                        HStack(spacing: 20) {
                            Button(action: {
                                if cartManager.cartProducts[index].quantity > 0 {
                                    cartManager.cartProducts[index].quantity -= 1
                                    cartManager.updateCart(product: cartManager.cartProducts[index])
                                }
                            }) {
                                Text("-")
                                    .font(.title)
                                    .frame(width: 30, height: 30)
                                    .background(Color.gray.opacity(0.2))
                                    .cornerRadius(15)
                            }
                            .buttonStyle(BorderlessButtonStyle())

                            Text("\(cartManager.cartProducts[index].quantity)")
                                .font(.headline)
                                .frame(width: 40)

                            Button(action: {
                                cartManager.cartProducts[index].quantity += 1
                                cartManager.updateCart(product: cartManager.cartProducts[index])
                            }) {
                                Text("+")
                                    .font(.title)
                                    .frame(width: 30, height: 30)
                                    .background(Color.gray.opacity(0.2))
                                    .cornerRadius(15)
                            }
                            .buttonStyle(BorderlessButtonStyle())
                        }
                    }
                    .padding()
                }
            }
            .listStyle(PlainListStyle())

            if cartManager.totalCost < 8000 {
                Text("Добавьте еще товаров на \(8000 - cartManager.totalCost, specifier: "%.2f") тг для бесплатной доставки")
                    .foregroundColor(.red)
                    .padding()
            }

            Text("Итоговая стоимость: \(cartManager.totalCost, specifier: "%.2f") тг")
                .font(.headline)
                .padding()

            Button(action: {
                isCheckingOut = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    isCheckingOut = false
                    showingCheckoutScreen = true
                }
            }) {
                Text("Перейти к чекауту")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
            .disabled(cartManager.totalCost == 0)
        }
        .navigationTitle("Корзина")
        .navigationDestination(isPresented: $showingCheckoutScreen) {
            Text("Hello World!")
        }
        .overlay(
            Group {
                if isCheckingOut {
                    Color.black.opacity(0.4).edgesIgnoringSafeArea(.all)
                    ProgressView("Проверка актуальности корзины...")
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                }
            }
        )
    }
}

struct CartView_Previews: PreviewProvider {
    @StateObject static var cartManager = CartManager()
    static var previews: some View {
        CartView(cartManager: cartManager)
    }
}
