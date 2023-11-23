//
//  SheetViewModel+Shared.swift
//  EmitExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 23/11/23.
//

import Foundation

extension SheetViewModel {
    static func shared(params: SheetViewModelParams) -> SheetViewModel {
        var temp: SheetViewModel
        
        if _shared == nil {
            temp = SheetViewModel(params: params)
            _shared = temp
        }
        
        return _shared!
    }
    
    private static weak var _shared: SheetViewModel?
}
