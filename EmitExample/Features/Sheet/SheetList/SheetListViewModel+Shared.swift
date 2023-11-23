//
//  SheetListViewModel+Shared.swift
//  EmitExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 23/11/23.
//

import Foundation

extension SheetListViewModel {
    static func shared(params: SheetListViewModelParams) -> SheetListViewModel {
        var temp: SheetListViewModel
        
        if _shared == nil {
            temp = SheetListViewModel(params: params)
            _shared = temp
        }
        
        return _shared!
    }
    
    private static weak var _shared: SheetListViewModel?
}
