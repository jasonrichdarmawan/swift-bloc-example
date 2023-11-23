//
//  ContentWithStateViewModel+Shared.swift
//  EmitExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 23/11/23.
//

import Foundation

extension ContentWithStateViewModel {
    static func shared(initialState: ContentState) -> ContentWithStateViewModel {
        var temp: ContentWithStateViewModel
        
        if _shared == nil {
            temp = ContentWithStateViewModel(initialState: initialState)
            _shared = temp
        }
        
        return _shared!
    }
    
    private static weak var _shared: ContentWithStateViewModel?
}
