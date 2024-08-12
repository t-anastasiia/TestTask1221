//
//  ListView.swift
//  TestTask1221
//
//  Created by Анастасия Талмазан on 2024-08-09.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var viewModel: ProductViewModel

    var body: some View {
        ScrollView {
            ForEach(listProducts, id: \.self) { product in
                ListItemView(product: product)
                    .environmentObject(viewModel)
                Divider()
            }
        }
        .padding(.horizontal, 16)
        
    }
}

#Preview {
    ListView()
        .environmentObject(ProductViewModel(useCase: ProductUseCase(repository: ProductRepository(localDataSource: ProductLocalDataSource()))))
}
