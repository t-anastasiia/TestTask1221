//
//  GridView.swift
//  TestTask1221
//
//  Created by Анастасия Талмазан on 2024-08-09.
//

import SwiftUI

struct GridView: View {
    
    @EnvironmentObject var viewModel: ProductViewModel

    var body: some View {
        
        let columns = [
            GridItem(.flexible(), spacing: -35),
            GridItem(.flexible())
        ]
        
        ScrollView {
            LazyVGrid(columns: columns, spacing: 7) {
                ForEach(gridProduct, id: \.self) { product in
                    GridItemView(product: product)
                        .environmentObject(viewModel)
                }
            }
        }
    }
}

#Preview {
    GridView()
}
