//
//  RadioButton.swift
//  PUSH
//
//  Created by tiking on 2021/09/23.
//

import SwiftUI

struct RadioButtonModel: Identifiable, Hashable {
    let id = UUID()
    let index: Int
    let text: String
    
    init(index: Int, text: String) {
        self.index = index
        self.text = text
    }
}

struct RadioButton: View {
    
    @Binding var selectedIndex: Int
    private var models: [RadioButtonModel] = []
    
    init(selectedIndex: Binding<Int>, texts: [String]) {
        self._selectedIndex = selectedIndex
        
        var index = 0
        texts.forEach { text in
            let model = RadioButtonModel(index: index, text: text)
            models.append(model)
            index += 1
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            ForEach(models) { model in
                HStack(alignment: .center, spacing: 8) {
                    if model.index == self.selectedIndex {
                        ZStack(alignment: .center) {
                            Circle()
                                .stroke(Color.accentColor, style: StrokeStyle(lineWidth: 2))
                                .frame(width: 20, height: 20)
                            Circle()
                                .fill(Color.accentColor)
                                .frame(width: 12, height: 12)
                        }
                    } else {
                        Circle()
                            .stroke(Color.gray, style: StrokeStyle(lineWidth: 2))
                            .frame(width: 20, height: 20)
                    }
                    Text(model.index.description)
                        .font(.title2)
                    
                    Text(model.text)
                        .frame(maxWidth: .infinity)
                }
                .onTapGesture {
                    self._selectedIndex.wrappedValue = model.index
                }
            }
        }
    }
}
