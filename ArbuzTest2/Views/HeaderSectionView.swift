//
//  HeaderSectionView.swift
//  ArbuzTest2
//
//  Created by Димаш Алтынбек on 19.05.2024.
//

import SwiftUI

struct HeaderSectionView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image("arbuz_logo")
                    .resizable()
                    .frame(width: 100, height: 40)
                
                Spacer()
                
                Button(action: {}) {
                    Image(systemName: "bell")
                        .foregroundColor(.black)
                }
            }
            .padding(.horizontal)
            
            Text("Укажите свой адрес")
                .font(.caption)
                .foregroundColor(.gray)
                .padding(.horizontal)
            
            Text("Алматы")
                .font(.headline)
                .padding(.horizontal)
        }
        .padding(.top, 50)
    }
}

struct HeaderSectionView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderSectionView()
    }
}
