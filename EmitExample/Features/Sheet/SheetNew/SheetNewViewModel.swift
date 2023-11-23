//
//  SheetNewViewModel.swift
//  EmitExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 23/11/23.
//

import Foundation

final class SheetNewViewModel: ObservableObject {
    let id: UUID = UUID()
    
    @Published var count: Int
    
    init(params: SheetNewViewModelParams) {
        self.count = params.initialCount
        print("\(type(of: self)) \(#function) \(id)")
    }
    
    deinit {
        print("\(type(of: self)) \(#function) \(id)")
    }
}
