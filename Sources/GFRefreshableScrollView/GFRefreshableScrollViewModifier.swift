//
//  SwiftUIView.swift
//  SwiftUIView
//
//  Created by Gualtiero Frigerio on 05/08/21.
//

import SwiftUI

@available(iOS 13.0, *)
public struct GFRefreshableScrollViewModifier: ViewModifier {
    var action: () -> Void
    
    public func body(content: Content) -> some View {
        GFRefreshableScrollView(action: action) {
            content
        }
    }
}
