//
//  ContentView.swift
//  AwaFolder
//
//  Created by tiking on 2022/09/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isPresented = false
    
    var body: some View {
        VStack {
            ScrollView {
                FolderCollectionView()
            }
            Button(action: {
                isPresented = true
            }, label: {
                Text("写真を撮る")
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .frame(width: 150, height: 20)
            })
            .tint(.green)
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.roundedRectangle(radius: 10))
            .fullScreenCover(isPresented: $isPresented, content: {
                Color.green
            })
        }
        .padding()
    }
}

struct FolderCollectionView: View{
     private let columns: [GridItem] = Array(repeating: .init(.flexible()),
                                            count: 2)
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(SFSymbol.allCases) { symbol in
                VStack {
                    Image(symbol: symbol)
                        .frame(width: 100, height: 100)
                        .padding(16)
                    
                    Text(symbol.rawValue)
                        .font(.subheadline)
                        .foregroundColor(.black)
                }
                .padding(8)
            }
        }
    }
}

// Mock data
enum SFSymbol: String, CaseIterable, Identifiable {
    
    /// 􀓣
    case profile = "person.circle"
    
    /// 􀆄
    case xmark = "xmark"
    
    /// 􀊴
    case heart = "heart"
    
    /// 􀊵
    case heartFill = "heart.fill"
    
    /// 􀊫
    case search = "magnifyingglass"
    
    /// 􀎞
    case house
    
    /// 􀈎
    case edit = "square.and.pencil"
    
    /// 􀣋
    case gear = "gearshape"
    /// ＋
    case plus = "plus"
    
    /// 􀈟
    case paperplane = "paperplane"
    
    case bookmark = "bookmark"
    
    case bookmarkFill = "bookmark.fill"

    /// 􀈑
    case trash = "trash"
    
    /// 􀈊
    case pencil = "pencil"
    
    var id: String { rawValue }
    
}

extension Image {
    init(symbol: SFSymbol) {
        self.init(systemName: symbol.rawValue)
    }
}
