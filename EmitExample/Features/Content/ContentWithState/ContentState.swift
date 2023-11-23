//
//  ContentState.swift
//  EmitExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 22/11/23.
//

import Foundation

struct ContentState: ViewModelState {
    static func initial() -> ContentState {
        return ContentState(
            count: 0,
            onSubmitStatus: .initial
        )
    }
    
    var count: Int
    var onSubmitStatus: OnSubmitStatus
}
