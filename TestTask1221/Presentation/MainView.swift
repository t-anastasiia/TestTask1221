//
//  ContentView.swift
//  TestTask1221
//
//  Created by Анастасия Талмазан on 2024-08-07.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var viewModel = ProductViewModel(useCase: ProductUseCase(repository: ProductRepository(localDataSource: ProductLocalDataSource())))
    
    @State private var selectedProductsViewType: ProductsViewTypeEnum = .list
    
    var body: some View {
        VStack(spacing: 0) {
            navigationBar
            Divider()
            if selectedProductsViewType == .list {
                ListView()
                    .environmentObject(viewModel)
            } else {
                GridView()
                    .environmentObject(viewModel)
            }
        }
    }
}

extension MainView {
    var navigationBar: some View {
        HStack {
            Button {
                if selectedProductsViewType == .grid {
                    withAnimation {
                        selectedProductsViewType = .list
                    }
                } else {
                    withAnimation {
                        selectedProductsViewType = .grid
                    }
                }
            } label: {
                catalogTypeButton
            }
            Spacer()
        }
        .padding(EdgeInsets(top: 2,
                            leading: 8,
                            bottom: 2,
                            trailing: 0))
    }
    var catalogTypeButton: some View {
        HStack {
            if selectedProductsViewType == .grid {
                Image("gridIcon")
                    .resizable()
                    .frame(width: 16, height: 16)
            } else {
                Image("listIcon")
                    .resizable()
                    .frame(width: 16, height: 16)
            }
        }
        .foregroundStyle(Color("Primary001"))
        .padding(12)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color("Surfaces002"))
        )
    }
}

#Preview {
    MainView()
}
