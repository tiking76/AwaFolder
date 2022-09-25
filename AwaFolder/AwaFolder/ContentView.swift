//
//  ContentView.swift
//  AwaFolder
//
//  Created by tiking on 2022/09/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var client = WebSocketClient()
    @State private var isPresented = false
    
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView {
                    LazyVGrid(columns: Array(repeating: .init(.flexible()), count: 2)) {
                        ForEach(SFSymbol.allCases) { symbol in
                            VStack {
                                NavigationLink(destination: {
                                    Color.red
                                }, label: {
                                    Image(symbol: symbol)
                                        .frame(width: 100, height: 100)
                                        .padding(16)
                                })
                                Text(symbol.rawValue)
                                    .font(.subheadline)
                                    .foregroundColor(.black)
                            }
                            .padding(8)
                        }
                    }
                }
                VStack(spacing: 0) {
                    Spacer()
                    HStack(spacing: 0) {
                        Spacer()
                        Button(action: {
                            isPresented = true
                        }, label: {
                            Image(symbol: .paperplane)
                                .foregroundColor(.white)
                                .frame(width: 60, height: 60)
                                .background(Color.green)
                                .clipShape(Circle())
                                .shadow(radius: 5)
                        })
                        .fullScreenCover(isPresented: $isPresented, content: {
                            PostView()
                        })
                        .padding(.trailing, 16)
                    }
                }
            }
            .navigationTitle("Awaフォルダー")
            .navigationBarTitleDisplayMode(.inline)
        }
        .onFirstAppear {
            client.setup()
        }
        .onAppear() {
            client.connect()
        }
    }
}

