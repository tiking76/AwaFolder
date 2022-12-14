//
//  CameraView.swift
//  AwaFolder
//
//  Created by tiking on 2022/09/24.
//

import SwiftUI

struct CameraView: View {
    @ObservedObject private var avFoundationVM = AVFoundationVM()
    @Binding var isActive: Bool

    var body: some View {
        VStack {
            if avFoundationVM.image == nil {
                VStack {
                    CALayerView(caLayer: avFoundationVM.previewLayer)
                    Spacer()
                    HStack {
                        Button(action: {
                            self.isActive.toggle()
                        }) {
                            Text("キャンセル")
                        }
                        .frame(width: 80, height: 80, alignment: .leading)
                        Button(action: {
                            self.avFoundationVM.takePhoto()
                        }) {
                            Image(systemName: "camera.circle.fill")
                                .renderingMode(.original)
                                .resizable()
                                .frame(width: 80, height: 80, alignment: .center)
                        }
                    }
                    .padding(100)
                    .background(Color.black)
                }.onAppear {
                    self.avFoundationVM.startSession()
                }.onDisappear {
                    self.avFoundationVM.endSession()
                }
                .background(Color.white)
            } else {
                ZStack(alignment: .topLeading) {
                    VStack {
                        Spacer()
                        Image(uiImage: avFoundationVM.image!)
                            .resizable()
                            .scaledToFill()
                            .aspectRatio(contentMode: .fit)
                        Spacer()
                    }
                    HStack {
                        Button(action: {
                            avFoundationVM.image = nil
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .renderingMode(.original)
                                .resizable()
                                .frame(width: 30, height: 30, alignment: .leading)
                                .foregroundColor(.white)
                                .background(Color.clear)
                        }
                        .frame(width: 80, height: 80, alignment: .center)
                        Button(action: {
                            self.isActive.toggle()
                        }) {
                            Text("保存")
                        }
                        .frame(width: 80, height: 80, alignment: .trailing)
                    }
                }
                .background(Color.white)
            }
        }
    }
}

