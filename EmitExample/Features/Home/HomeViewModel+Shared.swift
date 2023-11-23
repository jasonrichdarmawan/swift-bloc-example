//
//  HomeViewModel+Shared.swift
//  EmitExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 23/11/23.
//

import Foundation

extension HomeViewModel {
    static func shared(params: HomeViewModelParams) -> HomeViewModel {
        var temp: HomeViewModel
        
        if _shared == nil {
            temp = HomeViewModel(params: params)
            _shared = temp
        }
        
        return _shared!
    }
    
    private static weak var _shared: HomeViewModel?
}
