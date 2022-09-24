//
//  SFSymbol.swift
//  WikiApp
//
//  Created by tiking on 2021/10/28.
//

import SwiftUI

enum SFSymbol: String, AllCases {
    
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
    
}

extension Image {
    init(symbol: SFSymbol) {
        self.init(systemName: symbol.rawValue)
    }
}
