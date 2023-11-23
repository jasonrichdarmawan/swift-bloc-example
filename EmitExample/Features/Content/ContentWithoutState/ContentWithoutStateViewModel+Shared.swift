//
//  ContentWithoutStateViewModel+Shared.swift
//  EmitExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 23/11/23.
//

import Foundation

extension ContentWithoutStateViewModel {
    static func shared(params: ContentWithoutStateViewModelParams) -> ContentWithoutStateViewModel {
        var temp: ContentWithoutStateViewModel
        
        if _shared == nil {
            temp = ContentWithoutStateViewModel(params: params)
            _shared = temp
        }
        
        return _shared!
    }
    
    static weak var _shared: ContentWithoutStateViewModel?
}
