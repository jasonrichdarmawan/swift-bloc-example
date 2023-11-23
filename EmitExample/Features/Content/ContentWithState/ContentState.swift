//
//  ContentState.swift
//  EmitExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 22/11/23.
//

import Foundation

struct ContentState {
    var count: Int
    var onSubmitStatus: OnSubmitStatus
    
    init(
        count: Int = 0,
        onSubmitStatus: OnSubmitStatus = .initial
    ) {
        self.count = count
        self.onSubmitStatus = onSubmitStatus
    }
}

// - MARK: ViewModelState

extension ContentState: ViewModelState {
    static func initial() -> ContentState {
        ContentState(
            count: 0,
            onSubmitStatus: .initial
        )
    }
}
