//
//  ContentState.swift
//  EmitExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 22/11/23.
//

import Foundation

struct ContentState: ViewModelState {
    static func initial() -> ContentState {
        return ContentState(onSubmitStatus: .initial)
    }
    
    var onSubmitStatus: OnSubmitStatus
}
