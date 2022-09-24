//
//  URLImageView.swift
//  WikiApp
//
//  Created by tiking on 2021/10/30.
//

import SwiftUI

struct URLImageView: View {
    
    @ObservedObject var viewModel: URLImageViewModel
    
    var body: some View {
        if let imageData = self.viewModel.downloadData {
            if let image = UIImage(data: imageData) {
                return Image(uiImage: image).resizable()
            } else {
                return Image(uiImage: UIImage()).resizable()
            }
        } else {
            return Image(uiImage: UIImage()).resizable()
        }
    }
}
