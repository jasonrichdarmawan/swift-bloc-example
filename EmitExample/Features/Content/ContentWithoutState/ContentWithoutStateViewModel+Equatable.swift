//
//  ContentWithoutStateViewModel+Equatable.swift
//  EmitExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 23/11/23.
//

import Foundation

extension ContentWithoutStateViewModel: Equatable {
    static func == (lhs: ContentWithoutStateViewModel, rhs: ContentWithoutStateViewModel) -> Bool {
        return lhs.count == rhs.count &&
               lhs.onSubmitStatus == rhs.onSubmitStatus &&
               lhs.isSheetPresented == rhs.isSheetPresented
    }
}
