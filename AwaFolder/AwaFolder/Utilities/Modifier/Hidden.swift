//
//  Hidden.swift
//  AwaFolder
//
//  Created by tiking on 2022/09/24.
//

import SwiftUI

extension View {
    @ViewBuilder func isHidden(_ isHidden: Bool) -> some View {
        if isHidden {
            hidden()
        } else {
            self
        }
    }
}
