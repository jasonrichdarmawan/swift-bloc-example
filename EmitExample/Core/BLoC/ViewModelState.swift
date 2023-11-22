//
//  ViewModelState.swift
//  EmitExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 22/11/23.
//

import Foundation

protocol ViewModelState: Equatable, Withable {
    static func initial() -> Self
}
