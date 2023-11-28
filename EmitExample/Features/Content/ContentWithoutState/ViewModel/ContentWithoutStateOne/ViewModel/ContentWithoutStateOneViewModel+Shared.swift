//
//  ContentWithoutStateViewModel+Shared.swift
//  EmitExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 23/11/23.
//

import Foundation

extension ContentWithoutStateOneViewModel {
    static func shared<T: ContentWithoutStateViewModel>(params: T.P) -> T {
        var temp: T
        
        if _shared == nil {
            temp = T(params: params)
            _shared = temp
        }
        
        return _shared as! T
    }
    
    static weak var _shared: (any ContentWithoutStateViewModel)?
}
