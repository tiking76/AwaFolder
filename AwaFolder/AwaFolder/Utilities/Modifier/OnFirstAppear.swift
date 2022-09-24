//
//  OnFirstAppear.swift
//  AwaFolder
//
//  Created by tiking on 2022/09/24.
//

import SwiftUI

struct OnAppearFirstModifier: ViewModifier {
    @State private var onAppearCalled = false
    let action: () -> Void
    
    func body(content: Content) -> some View {
        content.onAppear(perform: {
            defer {
                onAppearCalled = true
            }
            if !onAppearCalled {
                action()
            }
        })
    }
}

extension View {
    func onFirstAppear(perform action: @escaping () -> Void) -> some View {
        modifier(OnAppearFirstModifier(action: action))
    }
}

