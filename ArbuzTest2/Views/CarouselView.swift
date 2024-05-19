//
//  CarouselView.swift
//  ArbuzTest2
//
//  Created by Димаш Алтынбек on 19.05.2024.
//

import SwiftUI

struct CarouselView: View {
    let headers: [Product]
    @Binding var currentIndex: Int

    var body: some View {
        TabView(selection: $currentIndex) {
            ForEach(headers.indices, id: \.self) { index in
                HeaderView(product: headers[index])
                    .tag(index)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
        .animation(.easeInOut(duration: 0.5), value: currentIndex)
    }
}

struct CarouselView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselView(headers: sampleProducts, currentIndex: .constant(0))
    }
}

