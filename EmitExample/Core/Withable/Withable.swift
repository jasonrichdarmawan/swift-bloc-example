//
//  Withable.swift
//  EmitExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 22/11/23.
//

import Foundation

protocol Withable {}

extension Withable {
    func with(_ modify: (inout Self) throws -> Void) rethrows -> Self {
        var copy = self
        try modify(&copy)
        return copy
    }
}
