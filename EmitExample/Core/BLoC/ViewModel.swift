//
//  ViewModel.swift
//  EmitExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 22/11/23.
//

import Foundation

class ViewModel<S: ViewModelState>: ObservableObject {
    @Published private(set) var state: S = .initial()

    private var emitted = false
    private var privateState: S = .initial()

    func emit(_ s: S?) {

        if s == nil {
            return
        }
        if privateState == s && emitted {
            return
        }

        privateState = s!
        self.state = privateState
        emitted = true
    }
}
