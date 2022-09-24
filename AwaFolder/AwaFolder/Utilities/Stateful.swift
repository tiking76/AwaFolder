//
//  Stateful.swift
//  WikiApp
//
//  Created by tiking on 2021/10/28.
//

import Foundation

enum Stateful<Value> {
    case idle
    case loading
    case failed(Error)
    case loaded(Value)
}
