//
//  ContentViewModelParams.swift
//  EmitExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 23/11/23.
//

import Foundation

struct ContentWithoutStateViewModelOneParams: ContentWithoutStateViewModelParams {
    let initialCount: Int
    let initialOnSubmitStatus: OnSubmitStatus
    let initialIsSheetPresented: Bool
    
    init(
        initialCount: Int = 0,
        initialOnSubmitStatus: OnSubmitStatus = .initial,
        initialIsSheetPresented: Bool = false
    ) {
        self.initialCount = initialCount
        self.initialOnSubmitStatus = initialOnSubmitStatus
        self.initialIsSheetPresented = initialIsSheetPresented
    }
}
