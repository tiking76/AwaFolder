//
//  BookMarkButton.swift
//  WikiApp
//
//  Created by tiking on 2021/10/30.
//

import SwiftUI

struct BookMarkButton: View {
    @State var isBookMark: Bool
    
    var body: some View {
        Button(action: { isBookMark.toggle()  }) {
            ZStack(alignment: .trailing) {
                Image(symbol: SFSymbol.bookmark)
                    .foregroundColor(.primary)
                    .padding(.bottom, 4)
                    .isHidden(isBookMark)
                
                Image(symbol: SFSymbol.bookmarkFill)
                    .foregroundColor(.primary)
                    .padding(.bottom, 4)
                    .isHidden(!isBookMark)
            }
        }
    }
}
