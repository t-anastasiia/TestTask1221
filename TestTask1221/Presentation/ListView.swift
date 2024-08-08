//
//  ListView.swift
//  TestTask1221
//
//  Created by Анастасия Талмазан on 2024-08-09.
//

import SwiftUI

struct ListView: View {
    var body: some View {
        ScrollView {
            ForEach(listProducts, id: \.self) { product in
                ListItemView(product: product)
                Divider()
            }
        }
        .padding(.horizontal, 16)
        
    }
}

#Preview {
    ListView()
}
