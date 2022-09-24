//
//  Spacer.swift
//  WikiApp
//
//  Created by tiking on 2021/10/27.
//

import SwiftUI

struct VerticalSpacer: View {
    let height: CGFloat?
    let minHeight: CGFloat?
    
    init(height: CGFloat) {
        self.height = height
        self.minHeight = nil
    }
    
    init(minHeight: CGFloat) {
        self.height = nil
        self.minHeight = minHeight
    }

    var body: some View {
        Spacer()
            .frame(height: height)
            .frame(minHeight: minHeight)
    }
}
