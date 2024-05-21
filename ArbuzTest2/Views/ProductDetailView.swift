//
//  ProductDetailView.swift
//  ArbuzTest2
//
//  Created by Димаш Алтынбек on 19.05.2024.
//
import SwiftUI

struct ProductDetailView: View {
    var productId: UUID
    @State private var product: Product?
    @State private var isLoading = true
    @EnvironmentObject var cartManager: CartManager

    var body: some View {
        VStack {
            if isLoading {
                ProgressView("Загрузка...")
                    .progressViewStyle(CircularProgressViewStyle())
            } else if let product = product {
                Image(product.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                Text(product.name)
                    .font(.largeTitle)
                    .padding(.top, 8)
                Text("\(String(format: "%.2f", product.price)) тг")
                    .font(.title)
                    .padding(.top, 4)

                if product.quantity == 0 {
                    AddToCartButton(product: $product, cartManager: cartManager)
                } else {
                    QuantityControl(product: $product, cartManager: cartManager)
                }
            } else {
                Text("Товар не найден")
            }
        }
        .padding()
        .onAppear {
            loadProduct()
        }
    }

    private func loadProduct() {
        if let savedProducts = UserDefaults.standard.data(forKey: "products"),
           let decodedProducts = try? JSONDecoder().decode([Product].self, from: savedProducts),
           let product = decodedProducts.first(where: { $0.id == productId }) {
            self.product = product
            self.isLoading = false
        } else {
            self.isLoading = false
        }
    }
}

struct AddToCartButton: View {
    @Binding var product: Product?
    @ObservedObject var cartManager: CartManager

    var body: some View {
        Button(action: {
            if var newProduct = product {
                newProduct.quantity += 1
                self.product = newProduct
                cartManager.addToCart(product: newProduct)
            }
        }) {
            Text("Добавить в корзину")
                .frame(maxWidth: .infinity, maxHeight: 50)
                .padding()
                .font(.system(size: 15))
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
    }
}

struct QuantityControl: View {
    @Binding var product: Product?
    @ObservedObject var cartManager: CartManager

    var body: some View {
        HStack(spacing: 20) {
            Button(action: {
                if var newProduct = product {
                    if newProduct.quantity > 0 {
                        newProduct.quantity -= 1
                        self.product = newProduct
                        cartManager.removeFromCart(product: newProduct)
                    }
                }
            }) {
                Text("-")
                    .font(.title)
                    .frame(width: 30, height: 30)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(15)
            }
            .buttonStyle(BorderlessButtonStyle())

            Text("\(product?.quantity ?? 0)")
                .font(.headline)
                .frame(width: 40)

            Button(action: {
                if var newProduct = product {
                    newProduct.quantity += 1
                    self.product = newProduct
                    cartManager.addToCart(product: newProduct)
                }
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

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(productId: sampleProduct.id)
            .environmentObject(CartManager())
    }
}
