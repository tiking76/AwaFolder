//
//  LikeButton.swift
//  WikiApp
//
//  Created by tiking on 2021/10/30.
//

import SwiftUI

struct LikeButton: View {
    @State var isLike: Bool
    
    var body: some View {
        Button(action: { isLike.toggle() }) {
            ZStack(alignment: .trailing) {
                Image(symbol: SFSymbol.heart)
                    .foregroundColor(.primary)
                    .padding(.trailing, 16)
                    .isHidden(isLike)
                
                Image(symbol: SFSymbol.heartFill)
                    .foregroundColor(.primary)
                    .padding(.trailing, 16)
                    .isHidden(!isLike)
            }
        }
    }
}
