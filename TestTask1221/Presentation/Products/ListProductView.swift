//
//  ListProductView.swift
//  TestTask1221
//
//  Created by Анастасия Талмазан on 2024-08-07.
//

import SwiftUI

struct ListProductView: View {
    
    var product: Product
    
    var body: some View {
        HStack(spacing: 8) {
                Image(product.image)
                    .resizable()
                    .frame(width: 144, height: 144)
                    .overlay(alignment: .topLeading) {
                        if product.saleType != nil {
                            Text(product.saleType?.rawValue ?? "")
                                .foregroundStyle(Color("TextStatic001"))
                                .font(.system(size: 10))
                                .padding(EdgeInsets(top: 2,
                                                    leading: 12,
                                                    bottom: 4,
                                                    trailing: 6))
                                .background(RoundedCornerShape(tlRadius: 12,
                                                               trRadius: 6,
                                                               brRadius: 6,
                                                               blRadius: 0)
                                    .fill(Color(product.saleType == .hitPrice ? "HitPrice001" : "NewProduct001"))
                                )
                        }
                    }
                    .overlay(alignment: .bottomTrailing) {
                        if let discount = product.discount {
                            Text("\(discount)%")
                                .font(.custom("CeraRoundPro-Bold", size: 16))
                                .foregroundStyle(Color("Additional004"))
                        }
                    }
        }
    }
}

extension ListProductView {

}

struct RoundedCornerShape: Shape {
    var tlRadius: CGFloat = 0.0
    var trRadius: CGFloat = 0.0
    var brRadius: CGFloat = 0.0
    var blRadius: CGFloat = 0.0
    
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.minX + tlRadius, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX - trRadius, y: rect.minY))
        path.addArc(center: CGPoint(x: rect.maxX - trRadius, y: rect.minY + trRadius),
                    radius: trRadius,
                    startAngle: .degrees(-90),
                    endAngle: .degrees(0),
                    clockwise: false)
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - brRadius))
        path.addArc(center: CGPoint(x: rect.maxX - brRadius, y: rect.maxY - brRadius),
                    radius: brRadius,
                    startAngle: .degrees(0),
                    endAngle: .degrees(90),
                    clockwise: false)
        path.addLine(to: CGPoint(x: rect.minX + blRadius, y: rect.maxY))
        path.addArc(center: CGPoint(x: rect.minX + blRadius, y: rect.maxY - blRadius),
                    radius: blRadius,
                    startAngle: .degrees(90),
                    endAngle: .degrees(180),
                    clockwise: false)
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY + tlRadius))
        path.addArc(center: CGPoint(x: rect.minX + tlRadius, y: rect.minY + tlRadius),
                    radius: tlRadius,
                    startAngle: .degrees(180),
                    endAngle: .degrees(270),
                    clockwise: false)
        path.closeSubpath()

        return path
    }
}

struct ListProductView_Previews: PreviewProvider {
    static var product = Product(id: 1,
                                 previousPrice: 199.0,
                                 currentPrice: 120.90, 
                                 discount: 25, 
                                 saleType: .hitPrice,
                                 rating: 4.1,
                                 image: "product1")
    
    static var previews: some View {
        ListProductView(product: product)
    }
}
