//
//  Result+Fold.swift
//  EmitExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 22/11/23.
//

import Foundation

extension Result {
    func fold<T>(
        successTransform: (Success) -> T,
        errorTransform: (Failure) -> T
    ) -> T {
        switch self {
        case .success(let success):
            return successTransform(success)
        case .failure(let error):
            return errorTransform(error)
        }
    }
}
