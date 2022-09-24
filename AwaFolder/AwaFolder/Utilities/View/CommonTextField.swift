//
//  CommonTextField.swift
//  WikiApp
//
//  Created by tiking on 2021/10/27.
//

import SwiftUI

struct CommonTextField: View {
    @Binding var text: String
    let placeholder: String
    
    var body: some View {
        TextField(placeholder, text: $text)
            .font(.h2)
            .frame(idealWidth: 100 ,maxWidth: .infinity, idealHeight: 60, maxHeight: 80)
            .padding(.leading, 16)
            .background(Color.formBackground)
            .cornerRadius(10)
            .padding(.horizontal, 32)
    }
}
