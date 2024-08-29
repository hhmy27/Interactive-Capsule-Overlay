//
//  FractionalOutline.swift
//
//
//  Created by Lonnie Gerol on 2/24/24.
//

import SwiftUI

struct FractionalOutline: ViewModifier {

    let completionAmount: CGFloat
    let accentColor: Color

    func body(content: Content) -> some View {
        content
            .overlay(
                GeometryReader { geometry in
                    Capsule(style: .continuous)
                        .trim(from: 0, to: self.completionAmount)
                        .stroke(self.accentColor, lineWidth: 2.0)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                }
            )
            .animation(.linear(duration: 1.0), value: completionAmount)
    }

}

extension View {

    @ViewBuilder
    func fractionalOutline(completionAmount: CGFloat, accentColor: Color) -> some View {
        modifier(FractionalOutline(completionAmount: completionAmount, accentColor: accentColor))
    }

}

