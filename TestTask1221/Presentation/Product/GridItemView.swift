    //
    //  GridProductView.swift
    //  TestTask1221
    //
    //  Created by Анастасия Талмазан on 2024-08-07.
    //

    import SwiftUI

    struct GridItemView: View {
        
        @EnvironmentObject var viewModel: ProductViewModel
        
        var product: Product
        
        @State private var isAddingToCartIsOpen = false
        @State private var selectedAmountType: ProductAmountEnum = .weight
        @State private var isLiked = false
        
        var body: some View {
            GeometryReader { geometry in
                let itemWidth = geometry.size.width
                VStack(spacing: 10) {
                    ProductImageView(image: product.image,
                                     size: itemWidth,
                                     saleType: product.saleType,
                                     discount: product.discount,
                                     reviewsAmount: product.reviewsAmount,
                                     showWithReviews: true)
                    .clipShape(
                        RoundedCornerShape(tlRadius: 16,
                                           trRadius: 16,
                                           brRadius: 0,
                                           blRadius: 0)
                    )
                    .overlay(alignment: .topTrailing) {
                        ActionListView(isLiked: $isLiked)
                    }
                    infoView
                        .padding(EdgeInsets(top: 0,
                                            leading: 6,
                                            bottom: 4,
                                            trailing: 4))
                }
                .frame(width: itemWidth, height: itemWidth * 1.65)
                .background(
                    RoundedCornerShape(tlRadius: 16,
                                       trRadius: 16,
                                       brRadius: 20,
                                       blRadius: 20)
                    .fill(Color("TextStatic001"))
                )
                .compositingGroup()
                .shadow(color: Color("ShadowColor001"), radius: 8, x: 0, y: 0)
                .onChange(of: isAddingToCartIsOpen) {
                    if isAddingToCartIsOpen {
                        Task {
                            await viewModel.addToCart(product: product)
                        }
                    } else {
                        Task {
                            await viewModel.removeFromCart(product: product)
                        }
                    }
                }
            }
            .aspectRatio(0.6, contentMode: .fit)
        }
    }

    extension GridItemView {
        func printCartContents() {
            for item in viewModel.productsCart {
                print("\(item.name) - \(item.id)")
            }
        }
        var infoView: some View {
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    Text(product.name)
                        .font(.system(size: 12))
                        .foregroundStyle(Color("TextIcons002"))
                        .multilineTextAlignment(.leading)
                        .frame(alignment: .leading)
                    
                    Spacer()
                }
                
                if let country = product.country {
                    HStack(spacing: 4) {
                        Text("\(getCountryLabel(of: country)[0])")
                            .font(.system(size: 12))
                            .foregroundStyle(Color("TextIcons003"))
                        Text("\(getCountryLabel(of: country)[1])")
                            .font(.system(size: 15))
                        Spacer()
                    }
                }
                
                Spacer()
                
                if isAddingToCartIsOpen {
                    AddingProductView(product: product,
                                      isAddingToCartIsOpen: $isAddingToCartIsOpen)
                } else {
                    PriceView(product: product,
                              isAddingToCartIsOpen: $isAddingToCartIsOpen,
                              selectedAmountType: $selectedAmountType)
                    .environmentObject(viewModel)
                }
            }
        }
    }

    struct GridItemView_Previews: PreviewProvider {
        static var product = Product(id: 1,
                                     name: "чипсеки",
                                     previousPrice: 1232.1,
                                     currentPrice: 12.2,
                                     discount: nil,
                                     saleType: nil,
                                     rating: 5,
                                     reviewsAmount: 100,
                                     image: "product1",
                                     amountType: .piece,
                                     country: nil)
        
        static var previews: some View {
            GridItemView(product: product)
                .environmentObject(ProductViewModel(useCase: ProductUseCase(repository: ProductRepository(localDataSource: ProductLocalDataSource()))))
        }
    }
