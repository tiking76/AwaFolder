//
//  EditRadionButton.swift
//  PUSH
//
//  Created by tiking on 2021/09/23.
//

import SwiftUI

struct EditRadioButtonModel: Identifiable, Hashable {
    let id = UUID()
    let index: Int
    
    init(index: Int) {
        self.index = index
    }
}

struct EditRadioButton: View {
    
    @Binding var selectedIndex: Int
    @State var answers = ["", "", ""]
    private var models: [EditRadioButtonModel] = []
    
    init(selectedIndex: Binding<Int>, texts: [String]) {
        self._selectedIndex = selectedIndex
        
        var index = 0
        texts.forEach { text in
            let model = EditRadioButtonModel(index: index)
            models.append(model)
            index += 1
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            ForEach(models) { model in
                HStack(alignment: .center, spacing: 16) {
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
                    TextField("選択肢\(model.index)", text: $answers[model.index])
                }
                .onTapGesture {
                    self._selectedIndex.wrappedValue = model.index
                }
            }
        }
    }
}
