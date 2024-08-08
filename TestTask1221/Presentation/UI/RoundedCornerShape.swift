//
//  RoundedCornerShape.swift
//  TestTask1221
//
//  Created by Анастасия Талмазан on 2024-08-08.
//

import SwiftUI

struct RoundedCornerShape: Shape {
    var tlRadius: CGFloat
    var trRadius: CGFloat
    var brRadius: CGFloat
    var blRadius: CGFloat
    
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
