//
//  Stateful.swift
//  AwaFolder
//
//  Created by tiking on 2022/09/24.
//

import Foundation

enum Stateful<Value> {
    case idle
    case loading
    case failed(Error)
    case loaded(Value)
}

