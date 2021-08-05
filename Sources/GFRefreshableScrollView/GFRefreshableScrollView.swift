//
//  GFRefreshableScrollView.swift
//
//  Created by Gualtiero Frigerio on 05/08/21.
//

import SwiftUI

/// Enable pull down to refresh by wrapping the view inside a GeometryReader
/// and a ScrollView
@available(iOS 13.0, *)
public struct GFRefreshableScrollView<Content:View>: View {
    public init(action: @escaping () -> Void, @ViewBuilder content: @escaping () -> Content) {
        self.content = content
        self.refreshAction = action
    }
    
    public var body: some View {
        GeometryReader { geometry in
            ScrollView {
                content()
                    .anchorPreference(key: OffsetPreferenceKey.self, value: .top) {
                        geometry[$0].y
                    }
            }
            .onPreferenceChange(OffsetPreferenceKey.self) { offset in
                if offset > threshold {
                    refreshAction()
                }
            }
        }
    }
    
    // MARK: - Private
    
    private var content: () -> Content
    private var refreshAction: () -> Void
    private let threshold:CGFloat = 50.0
}



internal struct OffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
