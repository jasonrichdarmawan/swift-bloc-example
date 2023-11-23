//
//  SheetNewViewModel+Shared.swift
//  EmitExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 23/11/23.
//

import Foundation

extension SheetNewViewModel {
    static func shared(params: SheetNewViewModelParams) -> SheetNewViewModel {
        var temp: SheetNewViewModel
    
        if _shared == nil {
            temp = SheetNewViewModel(params: params)
            _shared = temp
        }
    
        return _shared!
    }
    
    private static weak var _shared: SheetNewViewModel!
}
