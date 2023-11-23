//
//  SheetListViewModel.swift
//  EmitExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 23/11/23.
//

import Foundation

final class SheetListViewModel: ObservableObject {
    let id = UUID()
    
    @Published var count: Int
    
    init(params: SheetListViewModelParams) {
        self.count = params.initialCount
        
        print("\(type(of: self)) \(#function) \(id)")
    }
    
    deinit {
        print("\(type(of: self)) \(#function) \(id)")
    }
}
