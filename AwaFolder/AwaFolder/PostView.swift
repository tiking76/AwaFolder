//
//  PostView.swift
//  AwaFolder
//
//  Created by tiking on 2022/09/24.
//

import SwiftUI

struct PostView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var socketClient = WebSocketClient()
    @State var imageData : Data = .init(capacity:0)
    @State var source:UIImagePickerController.SourceType = .photoLibrary
    @State var isActionSheet = false
    @State var isImagePicker = false
    @State private var text = ""
    @State private var postData = PostData(action: "sendphoto", base_64_image: "test", folder_name: "test")
    @State private var imageText = ""
    
    var body: some View {
        NavigationView{
            VStack(spacing:0){
                ZStack{
                    NavigationLink(
                        destination: Imagepicker(show: $isImagePicker, image: $imageData, text: $imageText, sourceType: source),
                        isActive:$isImagePicker,
                        label: {
                            Text("")
                        })
                    VStack(spacing: 16){
                        if imageData.count != 0{
                            Image(uiImage: UIImage(data: self.imageData)!)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(height: 250)
                                .cornerRadius(15)
                                .padding()
                        }
                        HStack(spacing:30){
                            Button(action: {
                                self.source = .photoLibrary
                                self.isImagePicker.toggle()
                            }, label: {
                                Text("Upload")
                            })
                            Button(action: {
                                self.source = .camera
                                self.isImagePicker.toggle()
                            }, label: {
                                Text("Take Photo")
                            })
                        }
                        TextField("写真のグループ", text: $text)
                            .textFieldStyle(.roundedBorder)
                            .padding(.horizontal, 32)
                        
                        Button(action: {
                            postData.base_64_image = imageText
                            print(imageData)
                            //print(imageText)
                            postData.folder_name = "ishinomakihackathon2022-awa-folder"
                            guard let jsonValue = try? JSONEncoder().encode(postData) else {
                                fatalError("Failed to encode to JSON.")
                            }
                            //print(String(bytes: jsonValue, encoding: .utf8)!)
                            socketClient.send(message: String(data: jsonValue, encoding: .utf8)!)
                        }, label: {
                            Text("投稿")
                        })
                        .tint(.black)
                        .buttonStyle(.borderedProminent)
                        //.disabled(text.isEmpty || !socketClient.isConnected)
                    }
                }
            }
            .onAppear {
                socketClient.setup()
                socketClient.connect()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading, content: {
                    Button(action: dismiss.callAsFunction, label: {
                        Image(symbol: .xmark)
                            .foregroundColor(.black)
                            .frame(width: 40, height: 40)
                    })
                })
            }
        }
        .ignoresSafeArea(.all, edges: .top)
        .background(Color.primary.opacity(0.06).ignoresSafeArea(.all, edges: .all))
    }
}

struct PostData: Codable {
    var action: String
    var base_64_image: String
    var folder_name: String
}
