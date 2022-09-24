//
//  CommonButton.swift
//  PUSH
//
//  Created by tiking on 2021/09/20.
//

import SwiftUI

struct CommonButton: View {
    let title: String
    let action: () -> Void
    let color: Color
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.h2)
                .foregroundColor(.white)
                .frame(idealWidth: 100 ,maxWidth: .infinity, idealHeight: 60, maxHeight: 60)
                .background(color)
                .cornerRadius(20)
                .padding(.horizontal, 48)
        }
    }
}
